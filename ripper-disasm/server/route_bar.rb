require 'roda'

class BarRoute < Roda
  route do |path|
    path.is 'foo' do
      'BarRoute, action foo'
    end
  end
end
