# Arrays in Ruby

# Creating arrays
empty_array = []
numbers = [1, 2, 3, 4, 5]
mixed = [1, "two", 3.0, :four]

# Accessing elements
puts "First element: #{numbers[0]}"
puts "Last element: #{numbers[-1]}"
puts "Range: #{numbers[1..3]}"

# Adding elements
numbers << 6
numbers.push(7)
numbers.unshift(0)

# Removing elements
numbers.pop
numbers.shift
numbers.delete_at(2)

# Array methods
puts "Length: #{numbers.length}"
puts "Include 3?: #{numbers.include?(3)}"
puts "Join: #{numbers.join(', ')}"
puts "Reverse: #{numbers.reverse}"
puts "Sort: #{[3,1,4,2].sort}"

# Iterating
numbers.each { |n| puts "Number: #{n}" }
mapped = numbers.map { |n| n * 2 }
puts "Mapped: #{mapped}"
