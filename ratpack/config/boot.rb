require 'rubygems'
require 'jbundler'
require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'])

ROOT = File.dirname(__dir__)
$LOAD_PATH << File.join(ROOT, 'app')
require File.join(ROOT, 'app', 'qustreax')
