module Adb
  module CommandsMap
    def self.get(command)
      @commands ||= {
        auth: Commands::A_AUTH,
        open: Commands::A_OPEN,
        sync: Commands::A_SYNC,
        close: Commands::A_CLSE,
        ready: Commands::A_OKAY,
        write: Commands::A_WRTE,
        connect: Commands::A_CNXN
      }

      @commands[command] || fail('incorrect command')
    end
  end
end
