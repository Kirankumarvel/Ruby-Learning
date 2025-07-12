# Memory Optimization Techniques
require 'objspace'

class OptimizedData
  def initialize(size)
    @data = Array.new(size) { |i| i.to_s }
    freeze
  end

  def stats
    {
      memory_usage: ObjectSpace.memsize_of(self),
      item_count: @data.size,
      shared_strings: @data.uniq.size
    }
  end
end

# Before optimization
data = OptimizedData.new(10_000)
puts "Initial: #{data.stats}"

# After optimization
class OptimizedData
  def initialize(size)
    @data = Array.new(size) { |i| i.to_s.freeze }
    @data.uniq!
    freeze
  end
end

optimized = OptimizedData.new(10_000)
puts "Optimized: #{optimized.stats}"
