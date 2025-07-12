# Security Best Practices
require 'securerandom'

class SecureAPI
  def initialize
    @tokens = {}
  end

  def authenticate(user, pass)
    token = SecureRandom.hex(32)
    @tokens[token] = { user: sanitize(user), timestamp: Time.now }
    token
  end

  private

  def sanitize(input)
    input.gsub(/[^a-zA-Z0-9_]/, '')
  end
end

api = SecureAPI.new
token = api.authenticate("admin", "password123")
puts "Generated secure token: #{token}"
