require 'thread'
#require 'redis-store'
require 'rack/session/abstract/id'

##
# First of all disable :sessions (app.rb & apps.rb).
# This removes Rack::Session::Cookie that uses by default.
#
# Add this lines to your app.rb or apps.rb:
# set :redis_uri, 'redis://127.0.0.1:6379/0/rack:session'
# Padrino.use Rack::Session::Redis, :redis_server => settings.redis_uri
#
# If you want to use redis as cache storage, add this lines to your app.rb:
# enable :caching
# register Padrino::Cache
# set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
#
module Rack
  module Session
    class Redis < Abstract::ID
      attr_reader :mutex, :pool

      DEFAULT_OPTIONS = Abstract::ID::DEFAULT_OPTIONS.merge \
        :redis_server => 'redis://127.0.0.1:6379/0/rack:session'

      def initialize(app, options = {})
        super

        @mutex = Mutex.new
        @pool = ::Redis::Factory.create @default_options[:redis_server]
      end

      def generate_sid
        loop do
          sid = super
          break sid unless @pool.get(sid)
        end
      end

      def get_session(env, sid)
        with_lock(env, [nil, {}]) do
          unless sid and session = @pool.get(sid)
            sid, session = generate_sid, {}
            unless /^OK/ =~ @pool.set(sid, session)
              raise "Session collision on '#{sid.inspect}'"
            end
          end
          [sid, session]
        end
      end

      def set_session(env, sid, session_data, options)
        with_lock(env, false) do
          @pool.set(sid, session_data)
        end
      end

      def destroy_session(env, sid, options)
        with_lock(env) do
          @pool.del(sid)
          generate_sid unless options[:drop]
        end
      end

      def with_lock(env, default = nil)
        @mutex.lock if env['rack.multithread']
        yield
      ensure
        @mutex.unlock if @mutex.locked?
      end

    end # Redis
  end # Session
end # Rack
