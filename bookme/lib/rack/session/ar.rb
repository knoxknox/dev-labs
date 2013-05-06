require 'active_record'
require 'rack/session/abstract/id'

##
# First of all disable :sessions (app.rb & apps.rb).
# This removes Rack::Session::Cookie that uses by default.
#
# To enable DB sessions add: Padrino.use Rack::Session::AR
# Don't forget to create a sessions table with this structure:
#   CREATE TABLE IF NOT EXISTS `sessions` (
#     `id` int(11) NOT NULL AUTO_INCREMENT,
#     `session_id` varchar(128) NOT NULL,
#     `data` text,
#     `updated_at` datetime DEFAULT NULL,
#   PRIMARY KEY (`id`),
#   KEY `index_sessions_on_session_id` (`session_id`),
#   KEY `index_sessions_on_updated_at` (`updated_at`)
#   ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
#
module Rack
  module Session

    class SessionStore < ActiveRecord::Base
      self.table_name = :sessions

      def data
        attr = read_attribute(:data)
        Marshal.load(Base64.decode64(attr))
      end

      def data=(v)
        write_attribute(:data, Base64.encode64(Marshal.dump(v)))
      end
    end

    class AR < Abstract::ID

      def init_session(sid)
        SessionStore.new(:session_id => sid, :data => {})
      end

      def find_session_by_id(sid)
        SessionStore.where(:session_id => sid).first if sid
      end

      def get_session(env, sid)
        ActiveRecord::Base.logger.quietly do
          unless sid and session = find_session_by_id(sid)
            # If the sid was nil or if there is no pre-existing session under the sid,
            # force the generation of a new sid and associate this sid with new session.
            sid = generate_sid
            session = init_session(sid)
            return false unless session.save
          end

          [sid, session.data]
        end
      end

      def set_session(env, sid, session_data, options)
        ActiveRecord::Base.logger.quietly do
          session = find_session_by_id(sid)
          session.data = session_data
          return false unless session.save
        end

        sid
      end

    end

  end # Session
end # Rack
