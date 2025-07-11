# Classes and Objects in Ruby

# Defining a class
class Person
  # Constructor
  def initialize(name, age)
    @name = name
    @age = age
  end

  # Instance method
  def introduce
    puts "Hi, I'm #{@name} and I'm #{@age} years old."
  end

  # Accessor methods (getters)
  def name
    @name
  end

  def age
    @age
  end

  # Setter methods
  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end
end

# Creating objects
person1 = Person.new("Alice", 25)
person2 = Person.new("Bob", 30)

# Calling methods
person1.introduce
person2.introduce

# Accessing attributes
puts "Person1's name: #{person1.name}"
puts "Person2's age: #{person2.age}"

# Modifying attributes
person1.name = "Alicia"
person1.age = 26
person1.introduce

# attr_accessor shortcut (creates getter and setter)
class Animal
  attr_accessor :name, :species

  def initialize(name, species)
    @name = name
    @species = species
  end

  def info
    "#{@name} is a #{@species}"
  end
end

dog = Animal.new("Rex", "Dog")
puts dog.info
dog.name = "Max"
puts dog.info
