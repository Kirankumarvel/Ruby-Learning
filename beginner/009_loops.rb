# Loops in Ruby

# while loop
count = 1
while count <= 5
  puts "While loop: #{count}"
  count += 1
end

# until loop (opposite of while)
count = 1
until count > 5
  puts "Until loop: #{count}"
  count += 1
end

# for loop
for i in 1..5
  puts "For loop: #{i}"
end

# each iterator (preferred in Ruby)
(1..5).each do |i|
  puts "Each iterator: #{i}"
end

# times iterator
5.times do |i|
  puts "Times iterator: #{i + 1}"
end

# Loop control
# break - exit loop
# next - skip to next iteration
# redo - restart current iteration
numbers = [1, 2, 3, nil, 5]
numbers.each do |n|
  next if n.nil?
  puts "Number: #{n}"
  break if n == 3
end

# Nested loops
(1..3).each do |i|
  (1..3).each do |j|
    puts "#{i} x #{j} = #{i * j}"
  end
end
