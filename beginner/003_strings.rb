# Strings in Ruby

# Creating strings
str1 = "Hello"
str2 = 'World'

# Concatenation
combined = str1 + " " + str2
puts combined

# Interpolation (only works with double quotes)
name = "Alice"
puts "Hello, #{name}!"

# Common methods
puts "Length: #{combined.length}"
puts "Uppercase: #{combined.upcase}"
puts "Lowercase: #{combined.downcase}"
puts "Capitalize: #{'hello'.capitalize}"
puts "Reverse: #{combined.reverse}"
puts "Substring: #{combined[0..4]}"
puts "Split: #{combined.split.inspect}"

# Multiline strings
multiline = <<~TEXT
  This is a 
  multiline string
  in Ruby
TEXT
puts multiline
