# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife-twitter'

Gem::Specification.new do |spec|
  spec.name          = "knife-twitter"
  spec.version       = Knife::Twitter::VERSION
  spec.authors       = ["sawanoboly"]
  spec.email         = ["sawanoboriyu@higanworks.com"]
  spec.description   = %q{knife-plugin for twitter.}
  spec.summary       = %q{tweet via knife(chef)}
  spec.homepage      = "https://github.com/higanworks/knife-twitter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "chef"
  spec.add_dependency "twitter"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
