$LOAD_PATH.unshift '.'

require 'lib/frack'
require 'app/models/user'
require 'app/controllers/users_controller'

use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::ContentLength
use Rack::Reloader, 0
use Frack::Router do
  match '/' => 'users#index'
end

run Frack::Application
