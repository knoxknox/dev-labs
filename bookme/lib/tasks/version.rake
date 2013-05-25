# Application tasks (rake -T)
# How to run: rake namespace:task_name[argument]
# Example: rake app:version or app:cleanup['24']

namespace :app do
  desc 'Print current app version'
  task :version => :environment do
    puts 'App version: 1.0'
  end
end

