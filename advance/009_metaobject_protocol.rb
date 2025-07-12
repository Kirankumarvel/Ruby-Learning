# Metaobject Protocol Example
class MetaObject
  def self.define_meta_method(name, &block)
    metaclass = class << self; self; end
    metaclass.define_method(name, &block)
  end

  define_meta_method :inject do |*args|
    new(*args).tap do |obj|
      yield(obj) if block_given?
    end
  end
end

obj = MetaObject.inject(:config) do |o|
  o.instance_variable_set(:@injected, true)
end

puts obj.inspect
