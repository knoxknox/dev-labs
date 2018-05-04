require 'bindata'

module Adb
  class PacketStructure < BinData::Record
    uint32le :command         # command identifier
    uint32le :arg0            # first argument
    uint32le :arg1            # second argument
    uint32le :data_length     # payload length (0 allowed)
    uint32le :data_checksum   # checksum of payload message
    uint32le :magic           # command ^ 0xffffffff
    rest     :payload         # remaining data in the packet
  end
end
