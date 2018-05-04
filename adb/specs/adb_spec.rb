COMMANDS = {
  sync:    -> { Adb::Command.sync(5, 10) },
  ready:   -> { Adb::Command.ready(5, 10) },
  close:   -> { Adb::Command.close(5, 10) },
  open:    -> { Adb::Command.open('destination', 5) },
  write:   -> { Adb::Command.write('SOME DATA HERE', 5, 10) },
  connect: -> { Adb::Command.connect('host:0:lookout_adb', 0x01000000, 4096) }
}

BINARY_PACKETS = {
  sync:    "SYNC\005\000\000\000\012\000\000\000\000\000\000\000\000\000\000\000\254\246\261\274".force_encoding('ASCII-8BIT'),
  ready:   "OKAY\005\000\000\000\012\000\000\000\000\000\000\000\000\000\000\000\260\264\276\246".force_encoding('ASCII-8BIT'),
  close:   "CLSE\005\000\000\000\012\000\000\000\000\000\000\000\000\000\000\000\274\263\254\272".force_encoding('ASCII-8BIT'),
  open:    "OPEN\005\000\000\000\000\000\000\000\014\000\000\000\242\004\000\000\260\257\272\261destination\000".force_encoding('ASCII-8BIT'),
  write:   "WRTE\005\000\000\000\012\000\000\000\016\000\000\000\262\003\000\000\250\255\253\272SOME DATA HERE".force_encoding('ASCII-8BIT'),
  connect: "CNXN\000\000\000\001\000\020\000\000\022\000\000\000\365\006\000\000\274\261\247\261host:0:lookout_adb".force_encoding('ASCII-8BIT')
}

BINARY_PACKETS.each do |command, packet|
  raise 'packet mismatch' if COMMANDS[command].call.to_binary_s != packet
  raise 'command mismatch' if Adb::CommandsMap.get(command) != Adb::PacketStructure.read(packet).command
end
