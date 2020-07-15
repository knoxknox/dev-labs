require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'Default route'
end

get '/health' do
  'Health check: OK'
end
