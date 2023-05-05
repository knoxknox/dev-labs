local key = KEYS[1]

local increment = tonumber(ARGV[1])
local maximum_limit = tonumber(ARGV[2])

-- PTTL codes
local key_exist_without_expire = -1
local key_does_not_exist_or_expired = -2

-- Status codes
local success_code = 0
local failure_key_has_no_expiration_code = -1
local failure_increment_exceeds_max_limit_code = -2

-- GCRA implementation
local ttl = redis.call("PTTL", key)
if ttl == key_exist_without_expire then
   return failure_key_has_no_expiration_code
elseif ttl == key_does_not_exist_or_expired then
   redis.call("SET", key, "", "PX", increment) -- ms
else
   local value = ttl + increment
   if value >= maximum_limit then
      return failure_increment_exceeds_max_limit_code
   end

   redis.call("PEXPIRE", key, value) -- expiration in ms
end

return success_code
