require 'app/handlers/base_handler'
require 'app/handlers/health_handler'
require 'app/handlers/not_found_handler'

module Labs

  ##
  # Default handler.
  #
  DEFAULT_ROUTE = NotFoundHandler

  ##
  # Routes configuration.
  # Syntax: { ::PATH => { ::METHOD => ::HANDLER } }
  #
  ROUTES = {
    '/' => { :get => HealthHandler },
    '/health' => { :get => HealthHandler, :post => HealthHandler }
  }

end
