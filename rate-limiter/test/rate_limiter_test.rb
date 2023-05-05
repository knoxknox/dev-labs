root = File.dirname(__dir__)
require "#{root}/lib/rate_limiter"

limiter = RateLimiter::GCRA.new('ping', '192.168.0.1', rate: 2, period: 1) # 2 req/sec

loop do
  sleep(1)
  limiter.increment
  puts "[#{Time.now}] used #{limiter.used} remaining #{limiter.remaining} (overflow=#{limiter.exceeded?})"
end
