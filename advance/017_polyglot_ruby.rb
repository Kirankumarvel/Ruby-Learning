# JRuby Integration Example
if defined?(JRUBY_VERSION)
  require 'java'
  
  java_import 'java.util.HashMap'
  
  map = HashMap.new
  map.put("ruby", "java")
  puts "Java Map: #{map}"
else
  puts "Running on CRuby"
end
