class Ngram
  def initialize(string)
    @result = []
    @tokens = string.split(/ /)
  end

  def tokenize(ngram_length)
    @tokens.each_with_index do |el, idx|
      boundary = idx + ngram_length - 1
      break if boundary >= @tokens.size

      @result.push(@tokens[idx..boundary])
    end

    @result
  end
end
