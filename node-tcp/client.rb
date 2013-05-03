require 'socket'

response = ''
host, port = 'localhost', 9999
TCPSocket.open(host, port) do |socket|
  socket.write('ping')
  response = socket.read
end
puts response
