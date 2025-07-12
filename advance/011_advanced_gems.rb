# Advanced Gem Structure Template
# Run: bundle gem --ext advanced_gem
require 'rake'
require 'rake/extensiontask'

Rake::ExtensionTask.new("advanced_gem") do |ext|
  ext.lib_dir = "lib/advanced_gem"
end

# This would be accompanied by:
# - ext/advanced_gem/extconf.rb
# - ext/advanced_gem/advanced_gem.c
# - lib/advanced_gem/version.rb
