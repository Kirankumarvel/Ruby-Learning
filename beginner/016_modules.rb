# Modules in Ruby

# Module as namespace
module MathFunctions
  PI = 3.14159

  def self.square(x)
    x * x
  end

  def self.circle_area(radius)
    PI * square(radius)
  end
end

puts "PI: #{MathFunctions::PI}"
puts "Square of 5: #{MathFunctions.square(5)}"
puts "Area of circle with radius 3: #{MathFunctions.circle_area(3)}"

# Module as mixin
module Greetable
  def greet
    "Hello, my name is #{@name}"
  end
end

class Person
  include Greetable

  def initialize(name)
    @name = name
  end
end

person = Person.new("Alice")
puts person.greet

# Multiple mixins
module Workable
  def work
    "#{@name} is working hard"
  end
end

class Employee < Person
  include Workable
end

employee = Employee.new("Bob")
puts employee.greet
puts employee.work

# extend vs include
module ClassMethods
  def class_info
    "This is #{self}"
  end
end

class Example
  extend ClassMethods  # Adds as class methods
end

puts Example.class_info

# Module composition
module A
  def a_method; "A"; end
end

module B
  def b_method; "B"; end
end

class Composed
  include A
  include B
end

obj = Composed.new
puts obj.a_method
puts obj.b_method
