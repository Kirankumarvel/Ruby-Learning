# Singleton Methods

# Adding to individual objects
str = "hello"
def str.shout
  upcase + "!"
end

puts str.shout # "HELLO!"
begin
  "another string".shout # NoMethodError
rescue => e
  puts "Error: #{e}"
end

# Using extend
module Shoutable
  def shout
    upcase + "!!!"
  end
end

str2 = "hello world"
str2.extend(Shoutable)
puts str2.shout

# Class-level singleton
class MyClass
  class << self
    def class_level_method
      "Class method"
    end
  end
end

puts MyClass.class_level_method

# Singleton class inspection
obj = Object.new
def obj.custom_method; end

puts "Singleton methods: #{obj.singleton_methods.inspect}"
puts "Singleton class: #{obj.singleton_class}"

# Practical example - configuration
configuration = Object.new

class << configuration
  attr_accessor :host, :port
  
  def to_s
    "Host: #{host}, Port: #{port}"
  end
end

configuration.host = "localhost"
configuration.port = 3000
puts configuration
