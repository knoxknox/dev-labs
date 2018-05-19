require_relative '../application'

class Static < Application
  get '/' do
    haml :application
  end
end
