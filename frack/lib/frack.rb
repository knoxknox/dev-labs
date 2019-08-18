$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'erb'
require 'tilt'
require 'rack'

module Frack
  autoload :Router, 'frack/router'
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
end
