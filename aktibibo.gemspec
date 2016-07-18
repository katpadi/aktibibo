# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aktibibo/version'

Gem::Specification.new do |spec|
  spec.name          = "aktibibo"
  spec.version       = Aktibibo::VERSION
  spec.authors       = ["Kat Padilla"]
  spec.email         = ["hello@katpadi.ph"]

  spec.summary       = %q{Aktibibo allows an ActiveRecord model instance to be set as active, inactive or deactivated using convenience methods.}
  spec.description   = %q{Aktibibo allows an ActiveRecord model to be declared as "activatable". It provides scopes for filtering and convenience methods to set an instance as active, inactive or deactivated. It also saves the activation and deactivation dates.}
  spec.homepage      = "https://github.com/katpadi/aktibibo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'mysql2', '~> 0.3.18'

  spec.add_dependency "activerecord", "~> 4.1"
end
