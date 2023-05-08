require 'digest/md5'
require_relative 'redis'

##
# This module represents a rate limit on action/target pair.
#
# Next examples can be used as demo how this module can be used:
# - requests per ip address (action => requests, target => ip address)
# - transactions per account (action => transactions, target => id of account)
#
module RateLimiter
  class GCRA
    attr_reader :redis  # instance of available redis server
    attr_reader :action # the name of the action being rate limited
    attr_reader :target # target being rate limited (id, name, ip address, etc..)
    attr_reader :rate   # number of requests allowed in period (100 req/sec => rate is 100)
    attr_reader :period # period for which rate limit is defined (100 req/sec => period is 1 sec)

    def initialize(action, target, options = {})
      @action = action
      @target = target
      @rate = options.fetch(:rate)
      @period = options.fetch(:period)
      @redis = RateLimiter::Redis.new(::Redis.new(url: 'redis://127.0.0.1:6379'))
    end

    def reset
      redis.del(key)
    end

    def remaining
      rate - used
    end

    def exceeded?
      used + 1 > rate
    end

    def used
      return 0 if rate < 1
      return 0 if period < 1
      expiry = redis.pttl(key)
      return 0 if expiry == -2
      return rate if expiry == -1

      (rate * expiry / (period * 1000.0)).ceil
    end

    def increment
      return false if rate < 1
      return false if period < 1
      max_limit_msec = period * 1000
      increment_msec = (max_limit_msec / rate).to_i

      redis.execute_script(key, [increment_msec, max_limit_msec]) == 0
    end

    private

    def key
      @key ||= "rate_limiter:#{action}:#{Digest::MD5.base64digest(target.to_s)[0, 22]}"
    end
  end
end
