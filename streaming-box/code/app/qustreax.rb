module Qustreax
  autoload :Server, 'qustreax/server'

  module Handler
    autoload :Auth, 'qustreax/handler/auth'
    autoload :Filter, 'qustreax/handler/filter'
    autoload :Health, 'qustreax/handler/health'
    autoload :Protected, 'qustreax/handler/protected'
  end
end
