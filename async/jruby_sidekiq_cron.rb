##
# Example of scheduling tasks.
#
# ruby scheduler.rb (run once)
# bundle exec sidekiq -r ./worker.rb
#

# worker.rb
require 'sidekiq'
require 'httparty'
require 'sidekiq-cron'
require 'sidekiq/testing/inline'

class Worker
  include Sidekiq::Worker

  def perform(uid)
    HTTParty.get('https://randomuser.me/api/')
  end
end

# scheduler.rb
require 'sidekiq'
require 'sidekiq-cron'

Sidekiq::Cron::Job.create(name: 'Demo', cron: '* * * * *', class: 'Worker', args: {uid: Time.now})
