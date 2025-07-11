# Variables in Ruby
# Variables are used to store data that can be referenced and manipulated in a program

# Local variables (start with lowercase or underscore)
name = "Alice"
_age = 25

# Instance variables (start with @)
@instance_var = "I'm an instance variable"

# Class variables (start with @@)
@@class_var = "I'm a class variable"

# Global variables (start with $)
$global_var = "I'm accessible everywhere"

# Constants (start with uppercase)
PI = 3.14159

puts "Local variable: #{name}"
puts "Instance variable: #{@instance_var}"
puts "Class variable: #{@@class_var}"
puts "Global variable: #{$global_var}"
puts "Constant: #{PI}"

# Variable interpolation in strings
puts "Hello, #{name}!"
