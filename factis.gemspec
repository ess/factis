# -*- encoding: utf-8 -*-
require File.expand_path('../lib/factis/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dennis Walters"]
  gem.email         = ["pooster@gmail.com"]
  gem.summary       = %q{Discretely remember and recall facts in your tests}
  gem.description   = <<-EOD
    Factis is a simple DSL for tracking state and such in your tests
    without muddying up the global object space.
  EOD
  gem.homepage      = "http://github.com/ess/factis"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "factis"
  gem.require_paths = ["lib"]
  gem.version       = Factis::VERSION

  gem.add_dependency 'awesome_print'
  gem.add_development_dependency 'cucumber'
  #gem.add_development_dependency 'rspec-core'
  #gem.add_development_dependency 'rspec-expectations'
  #gem.add_development_dependency 'rspec-mocks'
  gem.add_development_dependency 'rspec'
end
