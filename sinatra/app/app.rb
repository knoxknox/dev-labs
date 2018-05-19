class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  get '/' do
    'Index Page'
  end

end
