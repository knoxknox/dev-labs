$LOAD_PATH.unshift '.'

require 'lib/frack'
require 'app/models/user'
require 'app/controllers/users_controller'

use Rack::Reloader, 0
use Rack::ContentLength
use Rack::Static, root: 'public', urls: ['/css']

use Frack::Router do
  match '/' => 'users#redirect'
  match '/users/index' => 'users#index'
end

run Frack::Application
