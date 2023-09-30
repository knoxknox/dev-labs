require 'digest'
require 'openssl'
require 'base58-alphabets'
require "#{__dir__}/key.rb"

module Crypto
  class Wallet
    attr_reader :public_key
    attr_reader :private_key

    def initialize
      ec = generate_keys
      @public_key = Key.new(ec.public_key)
      @private_key = Key.new(ec.private_key)
    end

    def address
      @address ||= generate_address
    end

    private

    def generate_keys
      OpenSSL::PKey::EC.generate('secp256k1')
    end

    def rmd160_hash(hex)
      Digest::RMD160.hexdigest([hex].pack('H*'))
    end

    def sha256_hash(hex)
      Digest::SHA256.hexdigest([hex].pack('H*'))
    end

    def generate_address
      public_key_sha256 = sha256_hash(public_key.to_hex)
      public_key_sha256_rmd160 = rmd160_hash(public_key_sha256)
      versioned_public_key_sha256_rmd160 = "00#{public_key_sha256_rmd160}"
      checksum = sha256_hash(sha256_hash(versioned_public_key_sha256_rmd160))

      Base58.encode_hex("#{versioned_public_key_sha256_rmd160}#{checksum[0...8]}")
    end
  end
end
