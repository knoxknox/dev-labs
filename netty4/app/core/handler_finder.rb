require 'config/routes'

module Labs
  module HandlerFinder

    def self.process(ctx, request)
      uri = request.get_uri
      method = request.get_method.name.downcase.to_sym
      handler_class = ROUTES.dig(uri, method) || DEFAULT_ROUTE

      handler_class.new(ctx, request)
    end

  end
end
