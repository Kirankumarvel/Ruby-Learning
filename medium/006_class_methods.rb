# Class Methods

class Configuration
  def self.load
    @config ||= new
  end

  def self.set(key, value)
    load.send("#{key}=", value)
  end

  def self.get(key)
    load.send(key)
  end

  attr_accessor :host, :port, :timeout
end

Configuration.set(:host, "example.com")
Configuration.set(:port, 8080)
puts "Host: #{Configuration.get(:host)}"

# Alternative syntax
class Logger
  class << self
    def log(message)
      @@logs ||= []
      @@logs << message
    end
    
    def logs
      @@logs || []
    end
  end
end

Logger.log("System started")
Logger.log("User logged in")
puts Logger.logs.inspect

# Class inheritance
class Parent
  def self.class_method
    "Parent class method"
  end
end

class Child < Parent
  def self.class_method
    super + " extended by Child"
  end
end

puts Child.class_method

# Factory pattern
class Product
  def self.factory(type)
    case type
    when :electronic then ElectronicProduct.new
    when :physical then PhysicalProduct.new
    end
  end
end

class ElectronicProduct < Product; end
class PhysicalProduct < Product; end

electronic = Product.factory(:electronic)
physical = Product.factory(:physical)
puts electronic.class
puts physical.class
