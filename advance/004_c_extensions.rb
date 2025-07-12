# C Extension Example (requires compilation)
require 'fiddle'

# Simple C math function demonstration
libm = Fiddle.dlopen('libm.so.6')
ceil = Fiddle::Function.new(
  libm['ceil'],
  [Fiddle::TYPE_DOUBLE],
  Fiddle::TYPE_DOUBLE
)

puts "Ceiling of 3.2: #{ceil.call(3.2)}"

# Full C extension would require:
# 1. extconf.rb
# 2. .c source file
# 3. gem build process
