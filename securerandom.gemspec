# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'securerandom/version'

Gem::Specification.new do |spec|
  spec.name          = "securerandom"
  spec.version       = SecureRandom::VERSION
  spec.authors       = ["NARUSE, Yui"]
  spec.email         = ["naruse@airemix.jp"]

  spec.summary       = %q{Cryptographically Secure Pseudo Random Number Generator}
  spec.description   = %q{CSPRNG gem to update Ruby bundled one.}
  spec.homepage      = "https://github.com/nurse/securerandom"
  spec.license       = "BSD-2-Clause"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/securerandom/extconf.rb"]
  spec.required_ruby_version = '>= 2.3'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency 'rake-compiler-dock'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'yard'
end
