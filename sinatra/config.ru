require 'sidekiq/web'
require_relative 'config/boot.rb'

run Application
run Rack::URLMap.new('/api' => Api, '/web' => Static, '/sidekiq' => Sidekiq::Web)
