require_relative '../application'

class Api < Application
  get '/' do
    content_type :json
    { status: 200 }.to_json
  end
end
