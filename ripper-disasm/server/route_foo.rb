require 'roda'

class FooRoute < Roda
  route do |path|
    path.is 'bar' do
      'FooRoute, action bar'
    end
  end
end
