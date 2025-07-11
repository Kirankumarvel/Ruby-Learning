# Inheritance in Ruby

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "Some generic animal sound"
  end
end

class Dog < Animal
  def speak
    "#{@name} says Woof!"
  end

  def fetch
    "#{@name} fetches the ball"
  end
end

class Cat < Animal
  def speak
    "#{@name} says Meow!"
  end

  def climb
    "#{@name} climbs the tree"
  end
end

# Creating instances
animal = Animal.new("Generic")
dog = Dog.new("Rex")
cat = Cat.new("Whiskers")

puts animal.speak
puts dog.speak
puts dog.fetch
puts cat.speak
puts cat.climb

# Super method
class Bird < Animal
  def initialize(name, wingspan)
    super(name)  # Calls Animal's initialize
    @wingspan = wingspan
  end

  def speak
    super + " and Chirp!"  # Extends Animal's speak
  end

  def fly
    "#{@name} flies with #{@wingspan}cm wingspan"
  end
end

bird = Bird.new("Tweety", 15)
puts bird.speak
puts bird.fly

# Checking class hierarchy
puts "Bird is an Animal? #{bird.is_a?(Animal)}"
puts "Bird is a Dog? #{bird.is_a?(Dog)}"
