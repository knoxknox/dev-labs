desc 'Start server'
task :server do
  require 'jbundler'
  require 'config/boot.rb'

  Qustreax::Server.new('0.0.0.0', ENV['PORT'] || 3000).run
end
