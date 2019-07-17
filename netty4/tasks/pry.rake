desc 'Pry console'
task :console do
  require 'pry'
  require 'config/config.rb'

  Pry.start
end
