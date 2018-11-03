module Qustreax
  autoload :Server, 'qustreax/server'

  module Handler
    autoload :Health, 'qustreax/handler/health'
    autoload :Protected, 'qustreax/handler/protected'
  end
end
