# Modules and Mixins

module Greetable
  def greet
    "Hello, I'm #{name}"
  end
end

module Workable
  def work
    "#{name} is working"
  end
end

class Person
  include Greetable
  extend Workable
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def self.name
    "Class Person"
  end
end

person = Person.new("Alice")
puts person.greet
puts Person.work

# Namespacing
module Math
  PI = 3.14159
  
  def self.square(x)
    x * x
  end
end

puts Math::PI
puts Math.square(5)

# Method lookup path
module A; def a; 'a'; end end
module B; def b; 'b'; end end
module C; def c; 'c'; end end

class Example
  include A
  include B
  prepend C
  
  def example; 'example'; end
end

puts Example.ancestors.inspect
# => [C, Example, B, A, Object, Kernel, BasicObject]

# Enumerable mixin
class MyCollection
  include Enumerable
  
  def initialize(items)
    @items = items
  end
  
  def each(&block)
    @items.each(&block)
  end
end

collection = MyCollection.new([1,2,3])
puts collection.map { |x| x * 2 }.inspect
puts collection.select(&:even?).inspect
