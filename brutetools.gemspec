# -*- encoding: utf-8 -*-
require File.expand_path('../lib/brutetools/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["MOZGIII"]
  gem.email         = ["mike-n@narod.ru"]
  gem.description   = %q{Brutetools}
  gem.summary       = %q{Brutetools}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "brutetools"
  gem.require_paths = ["lib"]
  gem.version       = BruteTools::VERSION
end
