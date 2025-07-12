# Dynamic Methods

# define_method
class DynamicGenerator
  ['add', 'subtract', 'multiply', 'divide'].each do |operation|
    define_method(operation) do |x, y|
      case operation
      when 'add' then x + y
      when 'subtract' then x - y
      when 'multiply' then x * y
      when 'divide' then x.to_f / y
      end
    end
  end
end

calculator = DynamicGenerator.new
puts calculator.add(5, 3)
puts calculator.multiply(5, 3)

# method_missing with respond_to_missing?
class RomanNumerals
  def method_missing(name, *args)
    roman = name.to_s
    return super unless roman.match?(/^[IVXLCDM]+$/)
    
    convert(roman)
  end
  
  def respond_to_missing?(name, include_private = false)
    name.to_s.match?(/^[IVXLCDM]+$/) || super
  end
  
  private
  def convert(roman)
    # Simplified conversion
    roman.gsub!("IV", "IIII")
    roman.gsub!("IX", "VIIII")
    roman.gsub!("XL", "XXXX")
    roman.gsub!("XC", "LXXXX")
    roman.gsub!("CD", "CCCC")
    roman.gsub!("CM", "DCCCC")
    
    roman.chars.sum { |char| 
      case char
      when 'I' then 1
      when 'V' then 5
      when 'X' then 10
      when 'L' then 50
      when 'C' then 100
      when 'D' then 500
      when 'M' then 1000
      end
    }
  end
end

rn = RomanNumerals.new
puts rn.IV
puts rn.XII
puts "Responds to IV? #{rn.respond_to?(:IV)}"

# Using class_eval for dynamic methods
class Person
  ATTRIBUTES = [:name, :age, :email]
  
  ATTRIBUTES.each do |attr|
    class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def #{attr}=(value)
        @#{attr} = value
      end
      
      def #{attr}
        @#{attr}
      end
    RUBY
  end
end

person = Person.new
person.name = "Alice"
person.age = 30
puts "#{person.name} is #{person.age} years old"

# Dynamic delegation
class Printer
  def print(text)
    puts "Printing: #{text}"
  end
end

class Document
  def initialize
    @printer = Printer.new
  end
  
  def method_missing(name, *args, &block)
    if @printer.respond_to?(name)
      @printer.send(name, *args, &block)
    else
      super
    end
  end
  
  def respond_to_missing?(name, include_private = false)
    @printer.respond_to?(name, include_private) || super
  end
end

doc = Document.new
doc.print("Hello world")
puts "Responds to print? #{doc.respond_to?(:print)}"
