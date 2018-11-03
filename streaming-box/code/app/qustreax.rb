module Qustreax
  autoload :Server, 'qustreax/server'

  module Handler
    autoload :Auth, 'qustreax/handler/auth'
    autoload :Filter, 'qustreax/handler/filter'
    autoload :Health, 'qustreax/handler/health'
    autoload :Protected, 'qustreax/handler/protected'
  end

  module Routing
    autoload :Router, 'qustreax/routing/router'
    autoload :Routes, 'qustreax/routing/routes'
    autoload :RoutesMap, 'qustreax/routing/routes_map'
  end
end
