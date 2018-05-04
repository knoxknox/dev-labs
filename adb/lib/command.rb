module Adb
  module Command

    # Command constant: A_SYNC
    # SYNC(online, sequence, "")
    def self.sync(online, sequence)
      create(arg0: online, arg1: sequence, command: :sync)
    end

    # Command constant: A_OKAY
    # READY(local-id, remote-id, "")
    def self.ready(local_id, remote_id)
      create(arg0: local_id, arg1: remote_id, command: :ready)
    end

    # Command constant: A_CLSE
    # CLOSE(local-id, remote-id, "")
    def self.close(local_id, remote_id)
      create(arg0: local_id, arg1: remote_id, command: :close)
    end

    # Command constant: A_OPEN
    # OPEN(local-id, 0, "destination")
    def self.open(destination, local_id)
      create(arg0: local_id, command: :open, payload: destination + "\x00")
    end

    # Command constant: A_WRTE
    # WRITE(local-id, remote-id, "data")
    def self.write(data, local_id, remote_id)
      create(arg0: local_id, arg1: remote_id, command: :write, payload: data)
    end

    # Command constant: A_CNXN
    # CONNECT(version, maxdata, "system-identity-string")
    def self.connect(identity, version=0x01000000, maxdata=4096)
      create(arg0: version, arg1: maxdata, command: :connect, payload: identity)
    end

    # Creates a binary packet for ADB.
    # See docs here: master/adb/protocol.txt
    def self.create(arguments = {})
      arguments[:payload] ||= ''
      arguments[:command] = CommandsMap.get(arguments[:command])

      packet = PacketStructure.new(arguments)
      packet.magic = packet.command ^ 0xffffffff
      packet.data_length = packet.payload.length
      packet.data_checksum = PayloadChecksum.new(packet.payload).calculate
      packet
    end

  end
end
