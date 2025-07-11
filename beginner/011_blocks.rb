# Blocks in Ruby

# Blocks are chunks of code that can be passed to methods
# Enclosed in {} or do..end

# Using a block with each
[1, 2, 3].each { |n| puts "Number: #{n}" }

# Multi-line block
[1, 2, 3].each do |n|
  squared = n * n
  puts "#{n} squared is #{squared}"
end

# Creating methods that accept blocks
def greet
  puts "Before block"
  yield if block_given?
  puts "After block"
end

greet { puts "Inside the block" }

# Passing parameters to blocks
def repeat(n)
  n.times { yield }
end

repeat(3) { puts "Hello!" }

# Block variables
def calculate(a, b)
  yield(a, b)
end

sum = calculate(5, 3) { |x, y| x + y }
product = calculate(5, 3) { |x, y| x * y }

puts "Sum: #{sum}, Product: #{product}"

# Using & to convert block to Proc
def make_proc(&block)
  block
end

my_proc = make_proc { |x| x * 2 }
puts "Proc result: #{my_proc.call(5)}"
