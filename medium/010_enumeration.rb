# Enumeration

# Custom enumerable class
class Playlist
  include Enumerable
  
  def initialize(songs)
    @songs = songs
  end
  
  def each
    @songs.each { |song| yield song }
  end
  
  # Custom enumerable method
  def shuffle
    @songs.shuffle.each { |song| yield song }
  end
end

playlist = Playlist.new(["Song 1", "Song 2", "Song 3"])

puts "All songs:"
playlist.each { |song| puts song }

puts "Mapped:"
puts playlist.map { |song| song.upcase }.inspect

puts "Selected:"
puts playlist.select { |song| song.include?('2') }.inspect

puts "Shuffled:"
playlist.shuffle { |song| puts song }

# Lazy enumeration
numbers = 1..Float::INFINITY
puts "First 5 squares:"
puts numbers.lazy.map { |x| x * x }.first(5).inspect

# Chaining enumerables
transactions = [100, -50, 200, -150, 300]
result = transactions
  .select { |t| t > 0 }      # Only positives
  .map { |t| t * 0.2 }       # 20% tax
  .reduce(0, :+)             # Sum all

puts "Total tax: #{result}"

# group_by example
words = ["apple", "banana", "cherry", "date", "elderberry"]
length_groups = words.group_by { |word| word.length }
puts "Words by length: #{length_groups.inspect}"
