# Ruby Learning Path 🚀

![Ruby Version](https://img.shields.io/badge/Ruby-2.7+-red)
![License](https://img.shields.io/badge/License-MIT-blue)
![Progress](https://img.shields.io/badge/Progress-100%25-brightgreen)

A complete, structured curriculum for mastering Ruby programming from fundamentals to advanced concepts.

## Table of Contents

1. [Learning Paths](#learning-paths)
2. [Repository Structure](#repository-structure)
3. [Getting Started](#getting-started)
4. [How to Use](#how-to-use)
5. [Prerequisites](#prerequisites)
6. [Contributing](#contributing)
7. [License](#license)

## Learning Paths

### 🌱 Beginner Level (16 Programs)
- Core syntax and structures
- Object-oriented fundamentals
- Basic I/O operations

[👉 View Beginner Curriculum](https://github.com/Kirankumarvel/Ruby-Learning/blob/main/beginner/Readme.MD)

### 🚀 Medium Level (20 Programs)
- Metaprogramming techniques
- Design patterns
- Concurrency basics
- Gem development

[👉 View Medium Curriculum](https://github.com/Kirankumarvel/Ruby-Learning/blob/main/medium/Readme.MD)

### 🔥 Advanced Level (20 Programs)
- VM internals and optimization
- C extensions and FFI
- Advanced concurrency models
- Blockchain and ML implementations

[👉 View Advanced Curriculum](https://github.com/Kirankumarvel/Ruby-Learning/blob/main/advance/Readme.MD)

## Repository Structure

```
ruby-learning/
├── beginner/          # Fundamental concepts
│   ├── 001_variables.rb
│   └── ... (16 files)
├── medium/            # Intermediate techniques
│   ├── 001_exception_handling.rb
│   └── ... (20 files)
├── advanced/          # Professional-grade Ruby
│   ├── 001_metaprogramming_advanced.rb
│   └── ... (20 files)
├── LICENSE
└── README.md          # This file
```

## Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Kirankumarvel/Ruby-Learning.git
   cd ruby-learning
   ```

2. **Install dependencies**:
   ```bash
   bundle install
   ```

3. **Run verification**:
   ```bash
   rake test
   ```

## How to Use

### For Learners
```bash
# Work through levels sequentially
ruby beginner/001_variables.rb

# Jump to specific concepts
ruby medium/004_lambda_procs.rb

# Benchmark advanced programs
RUBYOPT="--jit" ruby advanced/005_jit_compilation.rb
```

### For Educators
```bash
# Run all beginner tests
rake test:beginner

# Verify medium-level examples
rake test:medium

# Check advanced requirements
rake test:advanced
```

## Prerequisites

| Level       | Requirements                      |
|-------------|-----------------------------------|
| Beginner    | Ruby 2.7+, basic programming knowledge |
| Medium      | Completion of beginner concepts   |
| Advanced    | Ruby 3.0+, C compiler (for extensions) |

## Learning Approach

1. **Hands-On Practice**:
   ```ruby
   # Modify examples in each file
   # Add your own test cases
   ```

2. **Progressive Complexity**:
   ```
   Variables → Closures → Metaprogramming → VM Hacking
   ```

3. **Real-World Patterns**:
   - Each program demonstrates production-quality techniques

## Contributing

We welcome contributions following this workflow:

1. Fork the repository
2. Create feature branch (`git checkout -b feature/improvement`)
3. Commit changes (`git commit -am 'Add array optimization'`)
4. Push to branch (`git push origin feature/improvement`)
5. Open Pull Request

## License

This curriculum is licensed under the [MIT License](LICENSE).

---

**Professional Recommendation**: Use this path to prepare for:
- Ruby certification exams
- High-performance application development
- Open-source contributions
- Technical interviews
```

Key features of this main README:

1. **Clear Navigation**: Direct links to each level's dedicated README
2. **Visual Hierarchy**: Icons and badges for quick scanning
3. **Usage Scenarios**: Separate instructions for learners vs educators
4. **Progressive Learning**: Emphasizes the step-up approach
5. **Practical Orientation**: Connects concepts to real-world applications

The document serves as:
- Central hub for the entire curriculum
- Quick-start guide for new learners
- Reference for experienced developers
- Contribution portal for the community

Would you like me to add any of these sections?
- Roadmap for future updates
- Success stories/use cases
- Integration with IDEs
- Certification preparation tips
