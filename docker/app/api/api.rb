require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'Default route'
end

get '/help' do
  'Visit: https://docs.docker.com/samples/'
end
