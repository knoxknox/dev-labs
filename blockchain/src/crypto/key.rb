module Crypto
  class Key
    attr_reader :key

    def initialize(key)
      @key = key
    end

    def to_hex
      private_key = key.respond_to?(:to_bn) == false
      private_key ? key.to_s(16).downcase : key.to_bn.to_s(16).downcase
    end
  end
end
