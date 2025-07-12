# Simple Parser with Racc (requires .y file)
require 'strscan'

class ArithmeticParser
  def parse(input)
    @scanner = StringScanner.new(input)
    parse_expression
  end

  private

  def parse_expression
    left = parse_term
    while @scanner.scan(/[+\-]/)
      op = @scanner.matched
      right = parse_term
      left = [op, left, right]
    end
    left
  end

  def parse_term
    # Simplified implementation
    @scanner.scan(/\d+/).to_i
  end
end

parser = ArithmeticParser.new
puts parser.parse("2+3-1").inspect #=> ["+", 2, ["-", 3, 1]]
