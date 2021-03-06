# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ripped_params/version'

Gem::Specification.new do |spec|
  spec.name          = "ripped_params"
  spec.version       = RippedParams::VERSION
  spec.authors       = ["Nemrow"]
  spec.email         = ["nemrowj@gmail.com"]
  spec.summary       = %q{Organize strong params into yaml files}
  spec.description   = %q{Specify all strong params into separate yaml files and have then turned into controller methods}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "byebug"

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'actionpack'
  spec.add_development_dependency 'activesupport'
end
