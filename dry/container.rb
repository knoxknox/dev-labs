##
# Documentation:
# http://dry-rb.org/gems/dry-container/
#
require 'dry-container'

class Session
  def fetch
    raise NotImplementedError
  end
end

class DbSession < Session
  def fetch
    'fetch data with db-session'
  end
end

class FileSession < Session
  def fetch
    'fetch data with file-session'
  end
end

class Authenticator
  def initialize(session)
    @session = session
  end

  def authenticate(opts = {})
    "authentication: #{@session.fetch}"
  end
end

##
# Default approach
#
puts Authenticator.new(DbSession.new).authenticate
puts Authenticator.new(FileSession.new).authenticate

##
# Using default DIC
#
container = Dry::Container.new
container.register(:db_session, DbSession.new)
container.register(:file_session, FileSession.new)
puts Authenticator.new(container[:db_session]).authenticate
puts Authenticator.new(container[:file_session]).authenticate

##
# Using customized DIC
#
class Container
  include Dry::Container::Mixin

  configure do |config|
    config.resolver = ->(container, key) { container[key] }
    config.registry = ->(container, key, item, opts) { container[key] = item }
  end
end

application_container = Container.new
application_container.register(:auth_session, DbSession.new)
puts Authenticator.new(application_container[:auth_session]).authenticate
application_container.register(:auth_session, FileSession.new)
puts Authenticator.new(application_container[:auth_session]).authenticate
