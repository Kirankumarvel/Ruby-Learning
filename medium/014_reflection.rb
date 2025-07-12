# Reflection

class Example
  attr_accessor :name, :value
  
  def initialize(name, value)
    @name = name
    @value = value
  end
  
  def display
    puts "#{@name}: #{@value}"
  end
  
  private
  def secret_method
    "This is private"
  end
end

example = Example.new("Test", 42)

# Inspecting objects
puts "Class: #{example.class}"
puts "Instance variables: #{example.instance_variables}"
puts "Methods: #{example.methods - Object.methods}"

# Querying methods
puts "Responds to display? #{example.respond_to?(:display)}"
puts "Responds to secret_method? #{example.respond_to?(:secret_method)}"

# Dynamic method calling
method_name = :display
example.send(method_name)

# Getting method objects
display_method = example.method(:display)
puts "Method owner: #{display_method.owner}"
puts "Method parameters: #{display_method.parameters}"

# Class introspection
puts "Ancestors: #{Example.ancestors}"
puts "Class methods: #{Example.methods - Class.methods}"

# Creating classes dynamically
dynamic_class = Class.new do
  def greet
    "Hello from dynamic class!"
  end
end

dynamic_obj = dynamic_class.new
puts dynamic_obj.greet

# Hook methods
class HookExample
  def self.inherited(subclass)
    puts "#{subclass} inherited from #{self}"
  end
  
  def self.method_added(method_name)
    puts "Method added: #{method_name}"
  end
end

class ChildClass < HookExample
  def new_method; end
end
