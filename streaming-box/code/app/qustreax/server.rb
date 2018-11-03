require 'java'

java_import 'java.net.InetAddress'
java_import 'ratpack.exec.Blocking'
java_import 'ratpack.server.BaseDir'
java_import 'ratpack.server.ServerConfig'
java_import 'ratpack.server.RatpackServer'

module Qustreax
  class Server

    def initialize(host, port)
      @host = host
      @port = port
      @server = server
    end

    def run
      @server.start
    end

    def shutdown
      @server.stop if @server
    end


    private

    def server
      RatpackServer.of do |s|
        s.serverConfig(config)

        s.handlers do |chain|
          chain.get 'health', Handler::Health
          chain.get 'protected', Handler::Protected
        end
      end
    end

    def config
      ServerConfig.
        embedded.
        port(@port.to_i).
        base_dir(BaseDir.find).
        props('config/server.props').
        address(InetAddress.getByName(@host)).
        development(ENV['RACK_ENV'] == 'development')
    end

  end
end
