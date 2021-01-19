##
# Rules:
# - positive lookahead (?=...)
# - negative lookahead (?!...)
# - positive lookbehind (?<=...)
# - negative lookbehind (?<!...)
#

# Lookahead after the match
puts '100 euros'.match(/\d+(?= euros)/)          # => 100

# Lookahead before the match
puts '100 euros'.match(/(?=\d+ euros)\d+/)       # => 100

# Negative Lookahead after the match
puts '100 pesos'.match(/\d+(?!\d| euros)/)       # => 100

# Negative Lookahead before the match
puts '100 pesos'.match(/(?!\d+ euros)\d+/)       # => 100

# Lookbehind after the match
puts 'EUROS100'.match(/\d{3}(?<=EUROS\d{3})/)    # => 100

# Lookbehind before the match
puts 'EUROS100'.match(/(?<=EUROS)\d{3}/)         # => 100

# Negative Lookbehind after the match
puts 'PESOS100'.match(/\d{3}(?<!EUROS\d{3})/)    # => 100

# Negative Lookbehind before the match
puts 'PESOS100'.match(/(?<!EUROS)\d{3}/)         # => 100

# Example of lookahead + lookbehind regex
puts 'abc_cba'.sub(/(?<=\w)(_)(?=\w)/, '-')      # => abc-cba
