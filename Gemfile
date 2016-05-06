# encoding: utf-8
# Copyright (c) 2016 Nathan Currier

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

source 'https://rubygems.org'

gemspec

group :development do
  gem 'rake', require: false

  # lint
  gem 'rubocop', require: false

  # test
  gem 'minitest', require: false
  gem 'simplecov', require: false
  gem 'codecov', require: false, install_if: ENV['TRAVIS']

  # doc
  gem 'kramdown', require: false
  gem 'yard', require: false,
              git: 'https://github.com/lsegal/yard.git'

  gem 'ghpages_deploy', require: false, install_if: ENV['TRAVIS'] && ENV['DOC']
end
