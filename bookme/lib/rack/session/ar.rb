require 'active_record'
require 'rack/session/abstract/id'

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

      def init_session(sid)
        SessionStore.new(:session_id => sid, :data => {})
      end

      def find_session_by_id(sid)
        SessionStore.where(:session_id => sid).first if sid
      end

    end

  end # Session
end # Rack
