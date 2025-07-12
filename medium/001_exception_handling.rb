# Exception Handling in Ruby

# Basic rescue
begin
  puts 10 / 0
rescue ZeroDivisionError => e
  puts "Error occurred: #{e.message}"
end

# Multiple rescue clauses
begin
  # Code that might raise exceptions
  file = File.open("nonexistent.txt")
  puts file.read
rescue Errno::ENOENT => e
  puts "File error: #{e}"
rescue StandardError => e
  puts "Generic error: #{e}"
end

# Ensure block (always executes)
begin
  puts "Opening resource..."
  raise "Simulated error"
rescue => e
  puts "Rescued: #{e}"
ensure
  puts "This always runs (cleanup here)"
end

# Custom exceptions
class ValidationError < StandardError
  def initialize(msg="Invalid input")
    super
  end
end

def validate_age(age)
  raise ValidationError, "Age cannot be negative" if age < 0
end

begin
  validate_age(-5)
rescue ValidationError => e
  puts "Validation failed: #{e}"
end

# Retry mechanism
attempts = 0
begin
  attempts += 1
  puts "Attempt #{attempts}"
  raise "Network error"
rescue
  retry if attempts < 3
  puts "Failed after #{attempts} attempts"
end
