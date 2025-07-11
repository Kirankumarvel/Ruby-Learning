# Methods in Ruby

# Simple method
def greet
  puts "Hello!"
end
greet

# Method with parameters
def greet_name(name)
  puts "Hello, #{name}!"
end
greet_name("Alice")

# Default parameters
def greet_with_default(name = "stranger")
  puts "Hello, #{name}!"
end
greet_with_default
greet_with_default("Bob")

# Return values
def add(a, b)
  return a + b
end
sum = add(3, 4)
puts "Sum: #{sum}"

# Implicit return (last expression is returned)
def multiply(a, b)
  a * b
end
puts "Product: #{multiply(3, 4)}"

# Multiple return values
def calculate(a, b)
  [a + b, a - b, a * b, a / b]
end
results = calculate(10, 2)
puts "Results: #{results}"

# Variable arguments
def sum_all(*numbers)
  numbers.sum
end
puts "Sum of all: #{sum_all(1, 2, 3, 4)}"
