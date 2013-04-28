# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kangaruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'kangaruby'
  spec.version       = KangaRuby::VERSION
  spec.authors       = ['Lee Dohm']
  spec.email         = ['lee@liftedstudios.com']
  spec.description   = %q{A Ruby port of KangaModeling, a text-to-graphics converter for UML-like visualizations.}
  spec.summary       = %q{A Ruby port of KangaModeling.}
  spec.homepage      = 'https://github.com/lee-dohm/kangaruby'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib', 'grammar']

  spec.add_dependency 'nokogiri', '~> 1.5'
  spec.add_dependency 'treetop', '~> 1.4'
  spec.add_dependency 'ttfunk', '~> 1.0'
end
