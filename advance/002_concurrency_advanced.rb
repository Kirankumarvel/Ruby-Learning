# Advanced Concurrency with Ractors (Ruby 3+)
require 'prime'

# Create ractors
ractor1 = Ractor.new do
  Prime.each(1000).count
end

ractor2 = Ractor.new do
  sleep 0.5 # Simulate IO-bound work
  "IO operation complete"
end

# Wait for results
results = []
loop do
  ract, result = Ractor.select(ractor1, ractor2)
  results << result
  break if results.size == 2
end

puts "Primes count: #{results[0]}"
puts "IO result: #{results[1]}"
