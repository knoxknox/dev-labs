class Application < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, File.join(root, 'templates')
  set :environment, Sprockets::Environment.new
  set :haml, format: :html5, layout: :application

  environment.css_compressor = :scss
  environment.js_compressor = :uglify
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
end
