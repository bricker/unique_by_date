# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unique_by_date/version'

Gem::Specification.new do |spec|
  spec.name          = "unique_by_date"
  spec.version       = UniqueByDate::VERSION
  spec.authors       = ["Bryan Ricker"]
  spec.email         = ["bricker88@gmail.com"]
  spec.description   = %q{A Rails validator for uniqueness by date.}
  spec.summary       = %q{A validator for Rails which allows you to validate the uniqueness of an attribute, scoped by a date attribute on the same model. Useful for when your URL's contain a URL slug and a date.}
  spec.homepage      = "https://github.com/bricker/unique_by_date"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 3.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "sqlite3-ruby"
end
