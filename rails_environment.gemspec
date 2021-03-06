# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'rails_environment/version'

Gem::Specification.new do |s|
  s.name          = "rails_environment"
  s.version       = RailsEnvironment::VERSION
  s.authors       = ["Steve Downey"]
  s.email         = ["steve.downtown@gmail.com"]
  s.homepage      = "https://github.com/stevedowney/rails_environment"
  s.summary       = "Convenience methods for detecting Rails environment."
  s.description   = "Eliminate silent errors in Rails environment detection due to typos."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "CHANGELOG.md", "Rakefile", "README.md"]
  
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'coveralls'
  
  if ENV['ENGINE_DEVELOPER'] == 'true'
    s.add_development_dependency "redcarpet"
    s.add_development_dependency "yard"
  end
  
end
