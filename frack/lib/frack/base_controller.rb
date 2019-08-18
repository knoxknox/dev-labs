module Frack
  class BaseController
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view, data)
      render_template(layout_path) do
        render_template(view_path(view))
      end
    end

    def params
      @params ||= begin
        query = env['QUERY_STRING']
        Rack::Utils.parse_nested_query(query)
      end
    end


    private

    def view_path(view)
      File.join(env['controller'], view)
    end

    def layout_path
      File.join('layouts', 'application')
    end

    def render_template(path, &block)
      Tilt.new(template_path(path)).render(self, &block)
    end

    def template_path(path)
      Dir[File.join('app', 'views', "#{path}.html.*")].first
    end

  end
end
