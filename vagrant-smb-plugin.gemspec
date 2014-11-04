# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-smb/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-smb"
  spec.version       = Vagrant::Smb::Plugin::VERSION
  spec.authors       = ["Matt Fellows"]
  spec.email         = ["matt.fellows@onegeek.com.au"]
  spec.summary       = "Vagrant plugin to automatically create and connect to a UNC share."
  spec.description   = "Vagrant plugin to automatically create and connect to a UNC share."
  spec.homepage      = "http://github.com/mefellows/vagrant-smb-plugin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", '~> 10.3', '>= 10.3.0'
  spec.add_development_dependency "bundler", "~> 1.6", '>= 1.6.0'
  spec.add_development_dependency "coveralls", "~> 0.7.1", '>= 0.7.1'
  spec.add_development_dependency "rspec-core", '~> 3.1', '>= 3.1.0'
  spec.add_development_dependency "rspec-expectations", '~> 3.1', '>= 3.1.0'
  spec.add_development_dependency "rspec-mocks", '~> 3.1', '>= 3.1.0'
  spec.add_development_dependency "rspec-its", "~> 1.0.1", '>= 1.0.0'
  # spec.add_dependency "vagrant-dsc", "~> 1.0.1", '>= 1.0.0'
end
