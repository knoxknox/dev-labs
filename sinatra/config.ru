require 'sidekiq/web'
require_relative 'config/boot.rb'

run App
run Rack::URLMap.new('/' => App, '/w' => Sidekiq::Web)
