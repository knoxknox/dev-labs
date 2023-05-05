require 'redis'
require 'digest/sha1'
require 'forwardable'
require_relative 'script'

module RateLimiter
  class Redis
    extend Forwardable

    attr_reader :redis
    def_delegators :@redis, :del, :pttl

    GCRA_SCRIPT = Script.load('gcra.lua')
    GCRA_SCRIPT_HASH = Digest::SHA1.hexdigest(GCRA_SCRIPT)

    def initialize(redis)
      @redis = redis
    end

    def execute_script(key, argv)
      begin
        execute_script_from_cache(key, argv)
      rescue ::Redis::CommandError
        execute_script_with_cache(key, argv)
      end
    end

    private

    def execute_script_with_cache(key, argv)
      redis.eval(GCRA_SCRIPT, keys: [key], argv: argv)
    end

    def execute_script_from_cache(key, argv)
      redis.evalsha(GCRA_SCRIPT_HASH, keys: [key], argv: argv)
    end
  end
end
