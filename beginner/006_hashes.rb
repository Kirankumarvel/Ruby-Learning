# Hashes in Ruby (key-value pairs)

# Creating hashes
empty_hash = {}
person = { name: "Alice", age: 25, city: "New York" }
old_syntax = { "name" => "Bob", "age" => 30 }

# Accessing values
puts "Name: #{person[:name]}"
puts "Age: #{person[:age]}"

# Adding/modifying
person[:job] = "Developer"
person[:age] = 26

# Removing
person.delete(:city)

# Hash methods
puts "Keys: #{person.keys}"
puts "Values: #{person.values}"
puts "Has key?: #{person.key?(:name)}"
puts "Has value?: #{person.value?("Developer")}"

# Iterating
person.each do |key, value|
  puts "#{key}: #{value}"
end

# Nested hashes
team = {
  manager: { name: "Sarah", age: 35 },
  developer: { name: "Tom", age: 28 }
}
puts "Manager name: #{team[:manager][:name]}"
