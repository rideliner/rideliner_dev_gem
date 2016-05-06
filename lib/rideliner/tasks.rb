# encoding: utf-8
# Copyright (c) 2016 Nathan Currier

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require 'rubygems'

require 'bundler'
require 'bundler/gem_tasks'

Bundler.setup(:default, :development)

require 'rideliner/task/test'
require 'rideliner/task/yard'
require 'rideliner/task/rubocop'
require 'rideliner/task/ghpages_deploy_yard'

task default: %i(rubocop test)
task ci: 'test:coverage'
