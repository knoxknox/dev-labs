module Qustreax
  autoload :Server, 'qustreax/server'

  module Handler
    autoload :Status, 'qustreax/handler/status'
    autoload :Streaming, 'qustreax/handler/streaming'
  end
end
