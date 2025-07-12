# Minimal Async Web Server
require 'socket'
require 'async'

server = TCPServer.new(3000)
puts "Server running on port 3000"

Async do |task|
  loop do
    client = server.accept
    task.async do
      request = client.gets
      client.puts "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nHello World!"
      client.close
    end
  end
end
