# Advanced Ruby Programming

![Ruby Version](https://img.shields.io/badge/Ruby-3.0+-red)
![License](https://img.shields.io/badge/License-MIT-blue)

This repository contains 20 advanced Ruby programs demonstrating professional-grade techniques used in high-performance Ruby applications.

## Table of Contents

1. [Features](#features)
2. [Program Structure](#program-structure)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Concepts Covered](#concepts-covered)
6. [Performance Notes](#performance-notes)
7. [Contributing](#contributing)
8. [License](#license)

## Features

- **Production-Grade Patterns**: Industry-standard implementations
- **Cutting-Edge Ruby**: Ractors, JIT, WASM integration
- **Systems Programming**: C extensions, VM internals
- **Optimization Techniques**: Memory, concurrency, and algorithm optimization
- **Emerging Technologies**: Blockchain, ML, reactive programming

## Program Structure

| File | Category | Key Technologies |
|------|----------|------------------|
| `001_metaprogramming_advanced.rb` | Core Ruby | DSL creation, method_missing |
| `002_concurrency_advanced.rb` | Concurrency | Ractors, Guilds |
| `003_memory_optimization.rb` | Performance | ObjectSpace, GC tuning |
| `004_c_extensions.rb` | Systems | FFI, native extensions |
| `005_jit_compilation.rb` | Performance | MJIT, benchmarking |
| `006_domain_specific_languages.rb` | Patterns | Internal DSL design |
| `007_parser_compiler.rb` | Compilers | Racc, parse trees |
| `008_advanced_design_patterns.rb` | Architecture | Visitor, Decorator |
| `009_metaobject_protocol.rb` | Core Ruby | Singleton classes |
| `010_virtual_machines.rb` | Systems | RubyVM, bytecode |
| `011_advanced_gems.rb` | Packaging | Native extensions |
| `012_web_servers.rb` | Networking | Async I/O |
| `013_database_integration.rb` | Data | ActiveRecord, pooling |
| `014_security.rb` | Security | Sanitization, tokens |
| `015_debugging_profiling.rb` | Tooling | TracePoint, profiling |
| `016_ffi_wasm.rb` | Interop | Foreign Function Interface |
| `017_polyglot_ruby.rb` | Platforms | JRuby integration |
| `018_reactive_programming.rb` | Paradigms | Observable pattern |
| `019_machine_learning.rb` | AI/ML | Numo, linear algebra |
| `020_blockchain.rb` | Cryptography | SHA256, chain validation |

## Installation

1. **Prerequisites**:
   - Ruby 3.0+
   - Development tools (gcc, make)
   - For native extensions: `bundle config set with native_ext`

2. Clone repository:
   ```bash
   git clone https://github.com/Kirankumarvel/Ruby-Learning.git
   cd advance
   ```

3. Install dependencies:
   ```bash
   bundle install
   ```

## Usage

Run individual programs:
```bash
ruby 001_metaprogramming_advanced.rb
```

For native extensions (Programs 4, 11, 16):
```bash
cd ext/extension_name
ruby extconf.rb
make
```

Performance testing (Programs 3, 5, 15):
```bash
RUBYOPT="--jit" ruby 005_jit_compilation.rb
```

## Concepts Covered

### Core Ruby
- Metaobject protocol
- Method dispatch tuning
- Bytecode generation

### Systems Programming
- C extension development
- WebAssembly integration
- VM internals

### Performance
- Memory optimization
- JIT compilation
- Parallel execution

### Architecture
- Compiler design
- Reactive systems
- Blockchain implementation

## Performance Notes

1. **Memory Intensive Programs**:
   ```bash
   RUBY_GC_HEAP_GROWTH_MAX_SLOTS=30000 ruby 003_memory_optimization.rb
   ```

2. **Concurrency Models**:
   ```bash
   # For Ractor programs
   RUBYOPT="--ractor" ruby 002_concurrency_advanced.rb
   ```

3. **JIT Configuration**:
   ```bash
   RUBYOPT="--jit-min-calls=5 --jit-max-cache=10000" ruby 005_jit_compilation.rb
   ```

## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/improvement`)
3. Commit changes (`git commit -am 'Add advanced pattern'`)
4. Push to branch (`git push origin feature/improvement`)
5. Open Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Professional Tip**: Use these patterns as reference implementations when building:
- High-performance web servers
- Financial systems
- Data processing pipelines
- Embedded Ruby applications
```
