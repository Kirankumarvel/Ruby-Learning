# Numbers in Ruby

# Integers
int1 = 10
int2 = -5

# Floats
float1 = 3.14
float2 = -0.5

# Basic arithmetic
sum = int1 + float1
difference = int1 - int2
product = int1 * float2
quotient = int1 / 3.0
modulus = int1 % 3
exponent = 2 ** 3

puts "Sum: #{sum}"
puts "Difference: #{difference}"
puts "Product: #{product}"
puts "Quotient: #{quotient}"
puts "Modulus: #{modulus}"
puts "Exponent: #{exponent}"

# Number methods
puts "Absolute value: #{float2.abs}"
puts "Round: #{float1.round}"
puts "Floor: #{float1.floor}"
puts "Ceil: #{float1.ceil}"
puts "Square root: #{Math.sqrt(int1)}"

# Converting between types
string_num = "123"
num_from_string = string_num.to_i
puts "Converted number: #{num_from_string}"
