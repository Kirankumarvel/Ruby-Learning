# Serialization

require 'json'
require 'yaml'

# Basic object for serialization
class Person
  attr_accessor :name, :age, :hobbies
  
  def initialize(name, age, hobbies)
    @name = name
    @age = age
    @hobbies = hobbies
  end
  
  def to_s
    "#{name}, #{age} years old, hobbies: #{hobbies.join(', ')}"
  end
end

person = Person.new("Alice", 30, ["reading", "hiking", "coding"])

# Marshal serialization (Ruby-specific binary format)
serialized = Marshal.dump(person)
deserialized = Marshal.load(serialized)
puts "Marshal: #{deserialized}"

# JSON serialization
json_data = person.to_json
puts "JSON: #{json_data}"

# Custom JSON serialization
class Person
  def to_json(*options)
    {
      name: @name,
      age: @age,
      hobbies: @hobbies
    }.to_json(*options)
  end
  
  def self.from_json(json_string)
    data = JSON.parse(json_string)
    new(data['name'], data['age'], data['hobbies'])
  end
end

json = person.to_json
from_json = Person.from_json(json)
puts "From JSON: #{from_json}"

# YAML serialization
yaml_data = person.to_yaml
puts "YAML:\n#{yaml_data}"

from_yaml = YAML.load(yaml_data)
puts "From YAML: #{from_yaml}"

# Custom serialization with instance variables
class CustomSerializable
  attr_accessor :data
  
  def initialize(data)
    @data = data
    @secret = "s3cr3t"
  end
  
  def serialize
    instance_variables.each_with_object({}) do |var, hash|
      hash[var] = instance_variable_get(var)
    end.to_json
  end
  
  def self.deserialize(json_string)
    data = JSON.parse(json_string, symbolize_names: true)
    obj = allocate
    data.each do |var, value|
      obj.instance_variable_set(var, value)
    end
    obj
  end
end

original = CustomSerializable.new("important info")
serialized = original.serialize
deserialized = CustomSerializable.deserialize(serialized)
puts "Original data: #{original.data}"
puts "Deserialized data: #{deserialized.data}"
puts "Deserialized secret: #{deserialized.instance_variable_get(:@secret)}"
