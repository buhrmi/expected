# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'expected/version'

Gem::Specification.new do |gem|
  gem.name          = "expected"
  gem.version       = Expected::VERSION
  gem.authors       = ["Stefan Buhrmester"]
  gem.email         = ["buhrmi@gmail.com"]
  gem.description   = %q{The best way to ease development pain.}
  gem.summary       = %q{Adds a helper method that always returns what you expect}
  gem.homepage      = "http://github.com/buhrmi/expected"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'binding_of_caller'
end
