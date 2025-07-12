# Regular Expressions in Ruby

# Basic matching
text = "Ruby is awesome!"
puts "Found 'Ruby'" if text.match(/Ruby/)

# Case insensitive
puts "Found 'ruby'" if text.match(/ruby/i)

# Character classes
puts "Found vowel" if text.match(/[aeiou]/)

# Quantifiers
puts "Found double s" if text.match(/s{2}/)

# Anchors
puts "Starts with Ruby" if text.match(/^Ruby/)

# Capturing groups
date = "2023-04-15"
match_data = date.match(/(\d{4})-(\d{2})-(\d{2})/)
puts "Year: #{match_data[1]}, Month: #{match_data[2]}, Day: #{match_data[3]}"

# Substitution
puts text.gsub(/awesome/, 'fantastic')

# Named captures
phone = "Phone: 123-456-7890"
phone_match = phone.match(/(?<area>\d{3})-(?<exchange>\d{3})-(?<number>\d{4})/)
puts "Area code: #{phone_match[:area]}"

# Scan for multiple matches
words = "cat dog bat rat"
puts words.scan(/\w+at/)

# Splitting
csv = "apple,orange,banana"
puts csv.split(/,/)
