**Usage**
```
require 'base64'

string = "I'm killing your brain like a poisonous mushroom"
expected_b64 = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'
expected_hex = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'

string_as_hex = string.unpack('H*').first
puts expected_hex == string_as_hex
puts expected_b64 == Converter.new(string_as_hex).execute
puts Base64.strict_encode64(string) == Converter.new(string_as_hex).execute
```
