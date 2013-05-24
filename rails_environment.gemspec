# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'rails_environment/version'

Gem::Specification.new do |s|
  s.name          = "rails_environment"
  s.version       = RailsEnvironment::VERSION
  s.authors       = ["Steve Downey"]
  s.email         = ["steve.downtown@gmail.com"]
  s.homepage      = "https://github.com/stevedowney/rails_environment"
  s.summary       = "Convenience methods for deciding what Rails environment you are in."
  s.description   = "Eliminate silent errors in envionment detection due to typos."

  s.files         = `git ls-files app lib`.split("\n")
  
  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "CHANGELOG.md", "Rakefile", "README.md"]
  
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  
  s.add_development_dependency 'rspec'
end
