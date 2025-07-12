# Symbols Usage

# Basic symbol usage
status = :success
puts "Status: #{status}"

# Symbols vs strings
str1 = "hello"
str2 = "hello"
sym1 = :hello
sym2 = :hello

puts "Same string content? #{str1 == str2}" # true
puts "Same string object? #{str1.object_id == str2.object_id}" # false
puts "Same symbol object? #{sym1.object_id == sym2.object_id}" # true

# Memory implications
def create_strings
  1000.times.map { |i| "string_#{i}" }
end

def create_symbols
  1000.times.map { |i| "symbol_#{i}".to_sym }
end

strings = create_strings
symbols = create_symbols

puts "Strings memory: #{strings.map(&:object_id).uniq.size} unique objects"
puts "Symbols memory: #{symbols.map(&:object_id).uniq.size} unique objects"

# Practical uses
# 1. Hash keys
config = { :host => "localhost", :port => 3000 }
puts "Host: #{config[:host]}"

# Ruby 1.9+ syntax
new_config = { host: "example.com", port: 8080 }
puts "Port: #{new_config[:port]}"

# 2. Method arguments
def set_options(options = {})
  @verbose = options[:verbose] || false
  @retries = options[:retries] || 3
end

set_options(verbose: true, retries: 5)

# 3. Dynamic method calls
class DynamicCaller
  def call_method(method_name)
    send(method_name) if respond_to?(method_name)
  end
  
  def greet
    "Hello from dynamic call!"
  end
end

caller = DynamicCaller.new
puts caller.call_method(:greet)

# Symbol GC in Ruby 2.2+
# Before 2.2, symbols weren't garbage collected
# Now dynamically created symbols can be collected
def create_temp_symbols
  100.times { |i| "temp_symbol_#{i}".to_sym }
end

create_temp_symbols
puts "Symbol count: #{Symbol.all_symbols.grep(/temp_symbol/).count}"
