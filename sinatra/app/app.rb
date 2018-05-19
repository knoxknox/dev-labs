require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    'Index Page'
  end

end
