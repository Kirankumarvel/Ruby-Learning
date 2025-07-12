# Ruby VM Bytecode Inspection
puts "RubyVM::InstructionSequence.compile:"
iseq = RubyVM::InstructionSequence.compile('x = 1; x + 2')
puts iseq.disasm

# CRuby implementation details
puts "\nCRuby version: #{RUBY_ENGINE} #{RUBY_VERSION}"
