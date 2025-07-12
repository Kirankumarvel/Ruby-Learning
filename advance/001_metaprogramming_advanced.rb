# Advanced Metaprogramming: Building a DSL
class ConfigurationDSL
  def self.configure(&block)
    config = new
    config.instance_eval(&block)
    config
  end

  def database(settings)
    @database = OpenStruct.new(settings)
  end

  def method_missing(name, *args)
    if name.to_s.end_with?('=')
      var_name = name.to_s.chomp('=').to_sym
      instance_variable_set("@#{var_name}", args.first)
    else
      super
    end
  end
end

# Usage:
config = ConfigurationDSL.configure do
  database adapter: 'postgresql', pool: 5
  timeout 30
  api_key = 'SECRET_KEY'
end

puts config.inspect
