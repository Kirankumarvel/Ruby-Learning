# Duck Typing

class Bird
  def fly
    "Flying high!"
  end
end

class Airplane
  def fly
    "Taking off!"
  end
end

class Kite
  def fly
    "Dancing in the wind"
  end
end

def make_it_fly(flyer)
  puts flyer.fly
end

make_it_fly(Bird.new)
make_it_fly(Airplane.new)
make_it_fly(Kite.new)

# Practical example - File-like objects
class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def gets
    if @position >= @string.length
      nil
    else
      newline_index = @string.index("\n", @position)
      newline_index ||= @string.length
      chunk = @string[@position...newline_index]
      @position = newline_index + 1
      chunk
    end
  end

  def eof?
    @position >= @string.length
  end
end

def process_file(file)
  while line = file.gets
    puts "Processing: #{line.chomp}"
  end
  puts "Reached end of file" if file.eof?
end

# Works with real File
File.open("example.txt", "w") { |f| f.puts "Line 1\nLine 2" }
process_file(File.open("example.txt"))

# Also works with our adapter
string_data = "First line\nSecond line\nThird line"
adapter = StringIOAdapter.new(string_data)
process_file(adapter)
