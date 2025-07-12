# JIT Compilation Analysis
require 'benchmark'

def compute(n)
  (1..n).map { |i| i * i }.select(&:even?).sum
end

# Warm up JIT
3.times { compute(1000) }

# Benchmark
Benchmark.bm do |x|
  x.report("Without JIT:") { RubyVM::MJIT.pause { compute(1_000_000) } }
  x.report("With JIT:") { compute(1_000_000) }
end
