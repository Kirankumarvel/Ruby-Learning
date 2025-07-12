# Ruby Gem Creation

# 1. Basic gem structure
=begin
my_gem/
├── lib/
│   ├── my_gem.rb
│   └── my_gem/
│       └── version.rb
├── spec/
│   └── my_gem_spec.rb
├── Gemfile
├── my_gem.gemspec
└── Rakefile
=end

# 2. Example gem implementation
# my_gem.gemspec
=begin
Gem::Specification.new do |spec|
  spec.name          = "my_gem"
  spec.version       = MyGem::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your@email.com"]
  
  spec.summary       = "A simple gem example"
  spec.description   = "Demonstrates how to create a Ruby gem"
  spec.homepage      = "https://github.com/you/my_gem"
  spec.license       = "MIT"
  
  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
=end

# lib/my_gem.rb
=begin
require "my_gem/version"

module MyGem
  class Error < StandardError; end
  
  def self.greet(name = "world")
    "Hello, #{name}!"
  end
  
  def self.calculate(a, b, operation = :add)
    case operation
    when :add then a + b
    when :subtract then a - b
    when :multiply then a * b
    when :divide then a.to_f / b
    else raise Error, "Unknown operation"
    end
  end
end
=end

# lib/my_gem/version.rb
=begin
module MyGem
  VERSION = "0.1.0"
end
=end

# 3. Building and installing the gem
puts "To build and install your gem, run these commands:"
puts <<~CMD
  # Build the gem
  gem build my_gem.gemspec
  
  # Install the gem locally
  gem install ./my_gem-0.1.0.gem
  
  # Push to RubyGems.org (after setting up account)
  gem push my_gem-0.1.0.gem
CMD

# 4. Using the gem in code
puts "\nExample usage in code:"
puts <<~RUBY
  require 'my_gem'
  
  puts MyGem.greet("Rubyist")
  # => "Hello, Rubyist!"
  
  puts MyGem.calculate(10, 5, :multiply)
  # => 50
RUBY

# 5. Adding dependencies
puts "\nTo add runtime dependencies to your gem:"
puts <<~RUBY
  # In your gemspec:
  spec.add_dependency "httparty", "~> 0.18"
  spec.add_dependency "json", ">= 2.3"
RUBY

# 6. Creating executable gems
puts "\nTo add executables:"
puts <<~RUBY
  # In your gemspec:
  spec.executables << 'my_tool'
  
  # Create bin/my_tool file with:
  #!/usr/bin/env ruby
  require 'my_gem'
  # Your CLI code here
RUBY

# 7. Testing with RSpec
puts "\nExample RSpec test:"
puts <<~RUBY
  # spec/my_gem_spec.rb
  require 'spec_helper'
  require 'my_gem'
  
  RSpec.describe MyGem do
    describe '.greet' do
      it 'returns greeting message' do
        expect(MyGem.greet).to eq("Hello, world!")
        expect(MyGem.greet("Ruby")).to eq("Hello, Ruby!")
      end
    end
  end
RUBY

# 8. Publishing best practices
puts "\nGem publishing best practices:"
puts "- Write comprehensive tests"
puts "- Add documentation (YARD or RDoc)"
puts "- Include a LICENSE file"
puts "- Add a README.md with usage examples"
puts "- Version using semantic versioning (semver.org)"
puts "- Consider adding CI/CD with GitHub Actions"

# 9. Real-world example: Creating a simple HTTP client gem
module SimpleHttpClient
  require 'net/http'
  require 'uri'
  require 'json'
  
  class Client
    def initialize(base_url)
      @base_url = base_url
    end
    
    def get(path)
      uri = URI.join(@base_url, path)
      response = Net::HTTP.get_response(uri)
      JSON.parse(response.body)
    end
    
    def post(path, data)
      uri = URI.join(@base_url, path)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
      request.body = data.to_json
      response = http.request(request)
      JSON.parse(response.body)
    end
  end
end

puts "\nExample HTTP client usage:"
puts <<~RUBY
  client = SimpleHttpClient::Client.new("https://api.example.com")
  users = client.get("/users")
  new_user = client.post("/users", {name: "John", email: "john@example.com"})
RUBY
