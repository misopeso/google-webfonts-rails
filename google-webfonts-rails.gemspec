# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google-webfonts/version'

Gem::Specification.new do |gem|
  gem.name          = "google-webfonts-rails"
  gem.version       = GoogleWebfonts::VERSION
  gem.authors       = ["URAMOTO Kazunori"]
  gem.email         = ["kuprij@mac.com"]
  gem.description   = %q{Rails 3 helpers to use google webfonts}
  gem.summary       = %q{Rails 3 helpers to use google webfonts}
  gem.homepage      = ""

  gem.add_development_dependency 'rspec', '~> 2.8.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
