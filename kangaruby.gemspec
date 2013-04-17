# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kangaruby/version'

Gem::Specification.new do |spec|
  spec.name          = "kangaruby"
  spec.version       = Kangaruby::VERSION
  spec.authors       = ["Lee Dohm"]
  spec.email         = ["lee@liftedstudios.com"]
  spec.description   = %q{A Ruby port of KangaModeling, a text-to-graphics converter for UML-like visualizations.}
  spec.summary       = %q{A Ruby port of KangaModeling.}
  spec.homepage      = "https://github.com/lee-dohm/kangaruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
