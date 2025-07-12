# Visitor Pattern Implementation
module Visitable
  def accept(visitor)
    visitor.visit(self)
  end
end

class Product
  include Visitable
  attr_reader :price

  def initialize(price)
    @price = price
  end
end

class TaxVisitor
  def visit(item)
    case item
    when Product then item.price * 1.2
    when Array then item.sum { |i| visit(i) }
    end
  end
end

products = [Product.new(100), Product.new(200)]
visitor = TaxVisitor.new
puts "Total with tax: #{visitor.visit(products)}"
