# require 'rake'
# require 'rake/testtask'
# 
# Rake::TestTask.new do |t|
#   t.libs << 'lib'
#   t.pattern = 'test/**/*_test.rb'
#   t.verbose = false
# end
# 
# task :default => :test

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task :default => :spec
