# Design Patterns in Ruby

# 1. Singleton Pattern
require 'singleton'

class Logger
  include Singleton
  
  def initialize
    @log = File.open("log.txt", "a")
  end
  
  def log(msg)
    @log.puts(msg)
    @log.flush
  end
end

Logger.instance.log("Application started")
Logger.instance.log("Processing request...")

# 2. Factory Pattern
class PaymentProcessor
  def self.for(type)
    case type
    when :credit then CreditCardProcessor.new
    when :paypal then PayPalProcessor.new
    when :crypto then CryptoProcessor.new
    else raise "Unknown payment type"
    end
  end
end

class CreditCardProcessor
  def process(amount)
    "Processing $#{amount} via credit card"
  end
end

class PayPalProcessor
  def process(amount)
    "Processing $#{amount} via PayPal"
  end
end

class CryptoProcessor
  def process(amount)
    "Processing $#{amount} via cryptocurrency"
  end
end

processor = PaymentProcessor.for(:credit)
puts processor.process(100)

# 3. Observer Pattern
module Observable
  def initialize
    @observers = []
  end
  
  def add_observer(observer)
    @observers << observer
  end
  
  def notify_observers(*args)
    @observers.each { |observer| observer.update(*args) }
  end
end

class WeatherStation
  include Observable
  
  attr_reader :temperature
  
  def temperature=(value)
    @temperature = value
    notify_observers(:temperature, value)
  end
end

class Display
  def update(type, value)
    puts "#{type.capitalize} changed to #{value}" if type == :temperature
  end
end

station = WeatherStation.new
display = Display.new
station.add_observer(display)

station.temperature = 72
station.temperature = 68

# 4. Decorator Pattern
class Coffee
  def cost
    2.00
  end
  
  def description
    "Coffee"
  end
end

class MilkDecorator
  def initialize(coffee)
    @coffee = coffee
  end
  
  def cost
    @coffee.cost + 0.50
  end
  
  def description
    "#{@coffee.description} with Milk"
  end
end

class SugarDecorator
  def initialize(coffee)
    @coffee = coffee
  end
  
  def cost
    @coffee.cost + 0.25
  end
  
  def description
    "#{@coffee.description} with Sugar"
  end
end

coffee = Coffee.new
puts "#{coffee.description}: $#{coffee.cost}"

coffee_with_milk = MilkDecorator.new(coffee)
puts "#{coffee_with_milk.description}: $#{coffee_with_milk.cost}"

coffee_with_milk_and_sugar = SugarDecorator.new(coffee_with_milk)
puts "#{coffee_with_milk_and_sugar.description}: $#{coffee_with_milk_and_sugar.cost}"

# 5. Strategy Pattern
class Report
  attr_reader :title, :data
  attr_accessor :formatter
  
  def initialize(title, data, formatter)
    @title = title
    @data = data
    @formatter = formatter
  end
  
  def output
    formatter.output(self)
  end
end

class HTMLFormatter
  def output(context)
    puts "<html><head><title>#{context.title}</title></head><body>"
    context.data.each { |line| puts "<p>#{line}</p>" }
    puts "</body></html>"
  end
end

class JSONFormatter
  def output(context)
    puts "{"
    puts "  \"title\": \"#{context.title}\","
    puts "  \"data\": ["
    context.data.each_with_index do |line, index|
      puts "    \"#{line}\"#{index == context.data.size - 1 ? '' : ','}"
    end
    puts "  ]"
    puts "}"
  end
end

report = Report.new("Monthly Sales", ["Jan $1000", "Feb $1500", "Mar $2000"], HTMLFormatter.new)
report.output

puts "\nSwitching to JSON format:\n"
report.formatter = JSONFormatter.new
report.output
