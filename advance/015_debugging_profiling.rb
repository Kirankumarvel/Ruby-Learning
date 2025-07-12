# Advanced Debugging with TracePoint
trace = TracePoint.new(:call) do |tp|
  puts "Called: #{tp.defined_class}##{tp.method_id}"
end

trace.enable

def test_method
  sleep 0.1
end

test_method

trace.disable

# Memory profiling
require 'memory_profiler'
report = MemoryProfiler.report do
  1000.times { "test".upcase }
end
report.pretty_print
