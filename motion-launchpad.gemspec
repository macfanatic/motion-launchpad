# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'motion/launchpad/version'

Gem::Specification.new do |s|
  s.name          = "motion-launchpad"
  s.version       = Motion::Launchpad::VERSION
  s.authors       = ["Matt Brewer"]
  s.email         = ["matt.brewer@me.com"]
  s.homepage      = "https://github.com/macfanatic/motion-launchpad"
  s.summary       = "Provides an easy DSL for scheduling events on app launch"
  s.description   = "DSL to schedule events on app launch and keeps track of app launch for you."
  s.license       = "MIT"

  s.files         = Dir["lib/**/*"] + ["README.md"]
  s.test_files    = Dir["spec/**/*"]
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.rubyforge_project = '[none]'
  s.add_development_dependency "rake"
end
