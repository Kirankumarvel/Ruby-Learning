# FFI Demonstration
require 'ffi'

module CLibrary
  extend FFI::Library
  ffi_lib 'c'
  attach_function :sqrt, [:double], :double
end

puts "Square root via FFI: #{CLibrary.sqrt(16.0)}"

# WASM would require:
# - wasmtime or wasmer gem
# - compiled .wasm file
