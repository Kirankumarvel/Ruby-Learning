# Lambdas and Procs

# Proc basics
square = Proc.new { |x| x * x }
puts square.call(5)

# Lambda basics
cube = lambda { |x| x ** 3 }
puts cube.call(3)

# Differences
# 1. Return behavior
def proc_return
  Proc.new { return "proc return" }.call
  "method return"
end

def lambda_return
  lambda { return "lambda return" }.call
  "method return"
end

puts proc_return # => "proc return"
puts lambda_return # => "method return"

# 2. Argument checking
p = Proc.new { |a, b| [a, b] }
l = lambda { |a, b| [a, b] }

puts p.call(1).inspect # => [1, nil]
begin
  l.call(1) # ArgumentError
rescue => e
  puts "Lambda error: #{e}"
end

# Block to Proc conversion
def convert(&block)
  puts "Converted to: #{block.class}"
  block
end

proc_obj = convert { |x| x * 2 }
puts proc_obj.call(5)

# Closures
def power_factory(exponent)
  Proc.new { |base| base ** exponent }
end

square = power_factory(2)
cube = power_factory(3)

puts square.call(4) # 16
puts cube.call(4) # 64
