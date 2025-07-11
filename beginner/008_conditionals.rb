# Conditionals in Ruby

# if/elsif/else
age = 20
if age < 13
  puts "Child"
elsif age < 18
  puts "Teenager"
else
  puts "Adult"
end

# unless (opposite of if)
unless age >= 18
  puts "Not an adult"
else
  puts "Adult"
end

# case/when
grade = 'B'
case grade
when 'A'
  puts "Excellent!"
when 'B'
  puts "Good job!"
when 'C'
  puts "Needs improvement"
else
  puts "See me after class"
end

# Modifier form (if/unless at end)
puts "It's hot!" if temperature > 30
puts "Wear a jacket" unless temperature > 15

# Truthiness
# Only false and nil are false, everything else is true
if "hello"
  puts "Strings are truthy"
end

if nil
  puts "This won't print"
end
