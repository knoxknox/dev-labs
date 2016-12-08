module Qustreax
  autoload :Server, 'qustreax/server'

  module Handler
    autoload :Status, 'qustreax/status'
    autoload :Streaming, 'qustreax/streaming'
  end
end
