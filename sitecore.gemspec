# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sitecore/version'

Gem::Specification.new do |spec|
  spec.name          = 'sitecore'
  spec.version       = Sitecore::VERSION
  spec.authors       = ['Robert Boone']
  spec.email         = ['robert.boone@chaione.com']
  spec.summary       = %q{SiteCore Item API client.}
  spec.description   = %q{SiteCore Item API client.}
  spec.homepage      = 'www.chaione.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/{^bin\/}/) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/{^(test|spec|features)\/}/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'httparty', '~> 0.10'
end
