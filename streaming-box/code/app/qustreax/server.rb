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
        s.server_config(config)

        s.handlers do |chain|
          routes = Routing::Routes.new
          Routing::Router.new(routes).create(chain)
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
