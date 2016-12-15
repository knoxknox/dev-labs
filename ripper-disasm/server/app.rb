require 'roda'
require './route_bar'
require './route_foo'

class App < Roda
  plugin :multi_run

  run 'bar', BarRoute
  run 'foo', FooRoute

  route { |app| app.multi_run }
end
