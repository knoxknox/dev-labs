require 'rubygems'
require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'])

# autoload application code
root_folder = File.dirname(__dir__)
%w[config/init/*.rb app/**/*.rb].each do |path|
  Dir[File.join(root_folder, path)].each { |file| require file }
end
