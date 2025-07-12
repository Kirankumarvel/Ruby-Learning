# Custom Iterators

class TreeNode
  attr_accessor :value, :left, :right
  
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
  
  # Depth-first traversal
  def each(&block)
    left.each(&block) if left
    block.call(self.value)
    right.each(&block) if right
  end
  
  # Breadth-first traversal
  def each_level(&block)
    queue = [self]
    while !queue.empty?
      current = queue.shift
      block.call(current.value)
      queue << current.left if current.left
      queue << current.right if current.right
    end
  end
end

# Build a tree
root = TreeNode.new(10)
root.left = TreeNode.new(5)
root.right = TreeNode.new(15)
root.left.left = TreeNode.new(2)
root.left.right = TreeNode.new(7)
root.right.right = TreeNode.new(20)

puts "Depth-first traversal:"
root.each { |value| puts value }

puts "Breadth-first traversal:"
root.each_level { |value| puts value }

# Fibonacci sequence iterator
class Fibonacci
  include Enumerable
  
  def initialize(limit)
    @limit = limit
  end
  
  def each
    a, b = 0, 1
    while a <= @limit
      yield a
      a, b = b, a + b
    end
  end
end

puts "Fibonacci numbers up to 100:"
Fibonacci.new(100).each { |num| print "#{num} " }
puts

# Custom file line iterator
class FileLines
  def initialize(filename)
    @filename = filename
  end
  
  def each
    File.open(@filename) do |file|
      file.each_line { |line| yield line.chomp }
    end
  end
end

puts "First line of this file:"
FileLines.new(__FILE__).each.with_index(1) do |line, index|
  puts "#{index}: #{line}"
  break if index >= 5
end
