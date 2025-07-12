# method_missing

class RomanNumerals
  NUMERALS = {
    1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX',
    10 => 'X', 40 => 'XL', 50 => 'L', 90 => 'XC',
    100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM',
    1000 => 'M'
  }

  def method_missing(name, *args)
    roman = name.to_s
    return super unless roman.match?(/^[IVXLCDM]+$/)
    
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
puts rn.IV    # 4
puts rn.XII   # 12
puts rn.MCMXC # 1990

# Proxy pattern
class ApiProxy
  def initialize(real_api)
    @real_api = real_api
  end

  def method_missing(name, *args)
    puts "Logging call to #{name} with #{args.inspect}"
    @real_api.send(name, *args)
  end

  def respond_to_missing?(name, include_private = false)
    @real_api.respond_to?(name, include_private) || super
  end
end

class RealApi
  def get_user(id)
    "User #{id}"
  end
end

proxy = ApiProxy.new(RealApi.new)
puts proxy.get_user(42)
puts "Responds to get_user? #{proxy.respond_to?(:get_user)}"
