##
# Regex Cheat Sheet
#
# =~ - returns index that match or nil
# match(str) - returns MatchData object or nil
# match?(str) - true/false if regexp is matched
# scan(/regex/) - collects all regex matches into array
# sub(/regex/, replacement) - search and replace 1st occurrence
# gsub(/regex/, replacement) - search and replace all occurrence
#

# Check match
puts '123 456 789'.match?(/45/) # => true
puts '123 456 789'.match?(/50/) # => false

# Find 1st match
puts '123 456 789'[/45/] # => 45
puts '123 456 789' =~ /\d+/ # => 0
puts 'ABC DEF GHI' =~ /\d+/ # => nil
puts '123 456 789'.match(/45/) # => 45
puts 'found' if '123' =~ /\d+/ # => found

# Find all matches
puts '123 456 789'.scan(/\d+/) # => ['123', '456', '789']
puts '123 456 789'.scan(/(\d).(\d)/) # => [['1', '3'], ['4', '6'], ['7', '9']]
# ['1', '2', '3'], 1st capture: 1
# ['4', '5', '6'], 1st capture: 4
# ['7', '8', '9'], 1st capture: 7
'123 456 789'.scan(/(\d)(\d)(\d)/) { |x| puts "#{x.inspect}, 1st capture: #{$1}" }

# Accessing captured groups
'123 456 789' =~ /(\d)(\d\d)/
puts [$1, $2] == $~.captures # => ['1', '23']
group = 'John 42'.match(/(?<name>\w+) (?<age>\d+)/)
puts "#{group[:name]}, #{group[:age]}" # => John, 42
regex = /(?<num>(\d+))/
'123 456 789'.scan(regex).map { |x| Hash[regex.names.zip(x)] } # => array with 3 hashes
