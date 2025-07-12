# Benchmarking

require 'benchmark'

# Simple benchmarking
n = 1_000_000
Benchmark.bm do |x|
  x.report("String concatenation:") do
    str = ""
    n.times { str += "a" }
  end
  
  x.report("String interpolation:") do
    str = ""
    n.times { str = "#{str}a" }
  end
  
  x.report("String append:") do
    str = ""
    n.times { str << "a" }
  end
end

# Memory profiling
def memory_usage
  `ps -o rss= -p #{Process.pid}`.to_i / 1024
end

initial_memory = memory_usage
array = []
10_000.times { |i| array << "String #{i}" }
memory_with_array = memory_usage
puts "Memory used by array: #{memory_with_array - initial_memory} MB"

# Profiling specific code
def fibonacci(n)
  n <= 1 ? n : fibonacci(n-1) + fibonacci(n-2)
end

puts "\nFibonacci profiling:"
result = nil
time = Benchmark.measure { result = fibonacci(35) }
puts "Result: #{result}"
puts "Time taken: #{time.real.round(2)} seconds"

# Benchmarking iterations per second
Benchmark.bmbm do |x|
  x.report("Math.sqrt") { 1_000_000.times { Math.sqrt(2) } }
  x.report("Exponent 0.5") { 1_000_000.times { 2 ** 0.5 } }
end

# Comparing algorithms
def bubble_sort(arr)
  arr = arr.dup
  n = arr.length
  loop do
    swapped = false
    (n-1).times do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end
    break unless swapped
  end
  arr
end

def quick_sort(arr)
  return arr if arr.length <= 1
  pivot = arr.delete_at(arr.length / 2)
  left, right = arr.partition { |x| x < pivot }
  quick_sort(left) + [pivot] + quick_sort(right)
end

test_array = Array.new(1000) { rand(1..10000) }

Benchmark.bm(10) do |x|
  x.report("Bubble sort") { bubble_sort(test_array) }
  x.report("Quick sort") { quick_sort(test_array) }
  x.report("Built-in sort") { test_array.sort }
end

# Memory-efficient benchmarking
def process_large_data
  data = Array.new(1_000_000) { "x" * 1024 } # 1MB strings
  data.each { |str| str.downcase }
end

puts "\nMemory before: #{memory_usage} MB"
process_large_data
puts "Memory after: #{memory_usage} MB"
