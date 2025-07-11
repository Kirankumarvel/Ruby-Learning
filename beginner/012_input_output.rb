# Input and Output in Ruby

# Output
print "Hello " # No newline
puts "World"   # Adds newline
p "Debugging"  # Inspects object

# Input
print "Enter your name: "
name = gets.chomp  # gets reads input, chomp removes newline
puts "Hello, #{name}!"

# Reading numbers
print "Enter a number: "
number = gets.chomp.to_i
puts "Double of #{number} is #{number * 2}"

# File output
File.open("output.txt", "w") do |file|
  file.puts "This is line 1"
  file.puts "This is line 2"
end

# File input
puts "Reading file:"
File.foreach("output.txt") do |line|
  puts line
end

# Command line arguments
puts "You passed #{ARGV.size} arguments"
ARGV.each_with_index do |arg, i|
  puts "Argument #{i}: #{arg}"
end

# Formatted output
printf("Name: %s, Age: %d\n", "Alice", 25)
sprintf("Formatted: %05d", 123) # => "00123"
