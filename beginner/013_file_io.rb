# File I/O in Ruby

# Writing to a file
File.open("example.txt", "w") do |file|
  file.puts "This is line 1"
  file.puts "This is line 2"
  file.write "No newline here"
  file.puts "More text"
end

# Reading entire file at once
content = File.read("example.txt")
puts "File content:"
puts content

# Reading line by line
puts "Lines:"
File.foreach("example.txt") do |line|
  puts "> #{line.chomp}"
end

# Appending to a file
File.open("example.txt", "a") do |file|
  file.puts "\nAppended line"
end

# File information
puts "File exists? #{File.exist?('example.txt')}"
puts "File size: #{File.size('example.txt')} bytes"
puts "Is a directory? #{File.directory?('example.txt')}"

# Working with directories
Dir.mkdir("temp") unless Dir.exist?("temp")
puts "Directory contents:"
puts Dir.entries(".").join(", ")

# Renaming and deleting
File.rename("example.txt", "renamed.txt")
File.delete("renamed.txt")
Dir.delete("temp") if Dir.exist?("temp")

# Path manipulation
require 'pathname'
path = Pathname.new("/path/to/file.txt")
puts "Directory: #{path.dirname}"
puts "Basename: #{path.basename}"
puts "Extension: #{path.extname}"
