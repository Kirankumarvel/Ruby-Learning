# Operators in Ruby

# Arithmetic operators
a = 10
b = 3
puts "Addition: #{a + b}"
puts "Subtraction: #{a - b}"
puts "Multiplication: #{a * b}"
puts "Division: #{a / b}"
puts "Modulus: #{a % b}"
puts "Exponent: #{a ** b}"

# Comparison operators
puts "Equal: #{a == b}"
puts "Not equal: #{a != b}"
puts "Greater than: #{a > b}"
puts "Less than: #{a < b}"
puts "Greater or equal: #{a >= b}"
puts "Less or equal: #{a <= b}"

# Logical operators
x = true
y = false
puts "AND: #{x && y}"
puts "OR: #{x || y}"
puts "NOT: #{!x}"

# Assignment operators
c = 5
c += 2  # c = c + 2
puts "+= operator: #{c}"

# Ternary operator
age = 20
status = age >= 18 ? "Adult" : "Minor"
puts "Status: #{status}"
