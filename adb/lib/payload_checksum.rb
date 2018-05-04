module Adb
  class PayloadChecksum

    def initialize(payload)
      @payload = payload
    end

    def calculate
      (@payload.each_byte.inject(0) { |sum, i| sum += i }) & 0xffffffff
    end

  end
end
