##
# Generic Cell Rate Algorithm (GCRA)
# GCRA is a leaky bucket type rate limiting algorithm.
# This algorithm stores a key in Redis with ms-precision expiration.
# Expiration time represents the time that the limit will be completely reset.
# Each increment op converts the increment amount into milliseconds to be added to the expiry.
#
# Example:
# - Limit is 5 per 10 seconds
# - An increment by 1 first sets the key to expire in 2s
# - Another immediate increment by 4 sets the expiry to 10s
# - Subsequent increments fail until clock time catches up to expiry
#
# Visit next link to read more details about GCRA algorithm: https://brandur.org/rate-limiting
#
module RateLimiter
  require_relative 'rate_limiter/gcra'
end
