# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google-webfonts/version'

Gem::Specification.new do |gem|
  gem.name          = "google-webfonts-rails"
  gem.version       = GoogleWebfonts::Rails::Version::STRING
  gem.authors       = ["URAMOTO Kazunori"]
  gem.email         = ["kuprij@mac.com"]
  gem.description   = %q{A easiest way to introduce Google WebFonts to Rails application.}
  gem.summary       = %q{A easiest way to introduce Google WebFonts to Rails application.}
  gem.homepage      = "https://github.com/misopeso/google-webfonts-rails"

  gem.add_runtime_dependency 'activesupport', '> 3.2.0', '< 5.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.12.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
