desc 'Start server'
task :server do
  require 'jbundler'
  require 'config/config.rb'
  require 'app/core/server.rb'

  Labs::Server.new.listen(configatron.app.port)
end
