require 'json'
require 'net/http'

package = {
  :channel => '/7fh4910dk6uj90rtoj41',
  :data => { :id => Random.rand(20), :name => 'cj' }
}

uri = URI.parse('http://127.0.0.1:9095/')
status = Net::HTTP.post_form(uri, :message => JSON.dump(package))
puts status
