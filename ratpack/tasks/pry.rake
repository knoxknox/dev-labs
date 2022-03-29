desc 'Pry console'
task :console do
  require 'pry'
  require 'config/boot.rb'

  Pry.start
end
