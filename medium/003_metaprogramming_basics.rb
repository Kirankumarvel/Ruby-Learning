# Metaprogramming Basics

# define_method
class DynamicMethods
  ['add', 'subtract', 'multiply'].each do |action|
    define_method("#{action}_numbers") do |x, y|
      case action
      when 'add' then x + y
      when 'subtract' then x - y
      when 'multiply' then x * y
      end
    end
  end
end

dm = DynamicMethods.new
puts dm.add_numbers(5, 3)
puts dm.multiply_numbers(5, 3)

# send method
class Calculator
  def add(x, y) x + y end
  def subtract(x, y) x - y end
end

calc = Calculator.new
puts calc.send(:add, 10, 5)
method_name = :subtract
puts calc.send(method_name, 10, 5)

# method_missing
class RomanNumerals
  def method_missing(name, *args)
    roman = name.to_s
    roman.gsub!("IV", "IIII")
    roman.gsub!("IX", "VIIII")
    roman.gsub!("XL", "XXXX")
    roman.gsub!("XC", "LXXXX")
    
    roman.count("I") +
    roman.count("V") * 5 +
    roman.count("X") * 10 +
    roman.count("L") * 50 +
    roman.count("C") * 100
  end
end

rn = RomanNumerals.new
puts rn.IV
puts rn.XII
