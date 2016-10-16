##
# Hex to Base64
#
# Hex:             0x07      0xFF      0x02
# Binary:          0000 0111 1111 1111 0000 0010 (groups of 4 bits)
# Binary:          000001 111111 111100 000010   (groups of 6 bits)
#                  \____/ \____/ \____/ \____/
# Decimal:           1      63     60     2
# Lookup64:          B      /      8      C
#
class Converter
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def execute
    result = []
    split_hex_to_3_bytes.each do |x|
      bits = from_3_bytes_to_bits(x)
      group_of_6_bits = chunk(bits, 6)
      result << from_bit_group_to_base64(group_of_6_bits)
    end

    result.any? ? result.join : fail('Result set is empty')
  end


  private

  def chunk(string, chunk_size)
    string.scan(/.{#{chunk_size}}/)
  end

  def split_hex_to_3_bytes
    chunk(string, 6).map! { |x| chunk(x, 2) }
  end

  def from_3_bytes_to_bits(group)
    group.map { |x| x.to_i(16).to_s(2).rjust(8, '0') }.join
  end

  def from_bit_group_to_base64(bit_group)
    bit_group.map { |x| x.to_i(2) }.map { |x| base64_table[x] }.join
  end

  def base64_table
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'.freeze
  end

end
