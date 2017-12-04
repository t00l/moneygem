# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moneytest/version'

Gem::Specification.new do |spec|
  spec.name          = "moneytest"
  spec.version       = Moneytest::VERSION
  spec.authors       = ["t00l"]
  spec.email         = ["moisesdonoso@gmail.com"]

  spec.summary       = %q{Money test.}
  spec.description   = %q{Money test}
  spec.homepage      = "https://bitbucket.org/t00l/moneytest/src"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
