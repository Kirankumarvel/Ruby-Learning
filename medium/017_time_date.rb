# Time and Date

require 'time'

# Current time
now = Time.now
puts "Current time: #{now}"

# Specific time
birthday = Time.new(1990, 5, 15, 12, 30, 0)
puts "Birthday: #{birthday}"

# Time components
puts "Year: #{now.year}"
puts "Month: #{now.month}"
puts "Day: #{now.day}"
puts "Hour: #{now.hour}"
puts "Minute: #{now.min}"
puts "Second: #{now.sec}"

# Time formatting
puts "Formatted: #{now.strftime("%Y-%m-%d %H:%M:%S")}"
puts "RFC2822: #{now.rfc2822}"
puts "ISO8601: #{now.iso8601}"

# Time parsing
parsed_time = Time.parse("2023-04-15 14:30:00")
puts "Parsed time: #{parsed_time}"

# Time arithmetic
one_hour_later = now + 3600
one_day_earlier = now - 86400
puts "One hour later: #{one_hour_later}"
puts "One day earlier: #{one_day_earlier}"

# Time comparison
if birthday < now
  puts "Birthday has passed"
else
  puts "Birthday is coming"
end

# Time zones
puts "Local time zone: #{now.zone}"
utc_time = now.utc
puts "UTC time: #{utc_time}"

# Date calculations
require 'date'

today = Date.today
puts "Today: #{today}"

next_week = today + 7
puts "Next week: #{next_week}"

# Business days (excluding weekends)
def business_days_after(start_date, days)
  count = 0
  date = start_date
  while count < days
    date += 1
    count += 1 unless date.saturday? || date.sunday?
  end
  date
end

puts "5 business days from today: #{business_days_after(today, 5)}"

# Age calculation
def age(birth_date, on_date = Date.today)
  years = on_date.year - birth_date.year
  years -= 1 if on_date.month < birth_date.month || 
               (on_date.month == birth_date.month && on_date.day < birth_date.day)
  years
end

puts "Age: #{age(Date.new(1990, 5, 15))} years"
