# encoding: utf-8
# Copyright (c) 2016 Nathan Currier

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require './lib/rideliner/version'

Gem::Specification.new do |spec|
  spec.name          = 'rideliner'
  spec.version       = Rideliner::VERSION
  spec.authors       = ['Nathan Currier']
  spec.email         = ['nathan.currier@gmail.com']
  spec.license       = 'MPL-2.0'

  spec.description   = "Rideliner's Ruby development"
  spec.summary       = "Development setup and configuration for Rideliner's ruby projects"
  spec.homepage      = 'https://github.com/rideliner/rideliner_dev_gem'
  spec.has_rdoc      = 'yard'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'bundler'
  spec.add_dependency 'rake'
  spec.add_dependency 'rubocop'
  spec.add_dependency 'minitest'
  spec.add_dependency 'simplecov'
  spec.add_dependency 'codecov'
end
