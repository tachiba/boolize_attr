# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boolize_attr/version'

Gem::Specification.new do |spec|
  spec.name          = "boolize_attr"
  spec.version       = BoolizeAttr::VERSION
  spec.authors       = ["Takashi CHIBA"]
  spec.email         = ["contact@tachiba.jp"]
  spec.summary       = %q{Boolize string attributes and define accessors}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/tachiba/boolize_attr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
