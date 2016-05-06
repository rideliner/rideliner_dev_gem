# encoding: utf-8
# Copyright (c) 2016 Nathan Currier

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

def get_current_gemspec
  root = `git rev-parse --show-toplevel`.strip
  $? || abort('Only git repositories are supported')

  gemspecs = Dir["#{root}/*.gemspec"]
  abort "No gemspec found in #{root}" if gemspecs.empty?
  if gemspecs.length > 1
    $stderr.puts "Warning: only using the first gemspec found (#{gemspecs.first})."
  end

  Gem::Specification.load(gemspecs.first)
end

if ENV['TRAVIS'] && ENV['DOCS']
  namespace :yard do
    if ENV['TRAVIS_PULL_REQUEST'] == 'false'
      require 'ghpages_deploy/rake_task'

      desc 'Deploy documentation to Github Pages'
      GithubPages::DeployTask.new(deploy: [:yard]) do |t|
        t.remote = 'website'
        t.repo = 'https://github.com/rideliner/rideliner.github.io.git'
        t.source = '_yardoc'

        tag = ENV['TRAVIS_TAG']
        branch = ENV['TRAVIS_BRANCH']

        project = PROJECT_NAME || get_current_gemspec.name
        project_root = "project/#{project}"
        doc_root = "#{project_root}/doc"

        if !tag.empty?
          t.destination = "#{doc_root}/tag/#{tag}"
          t.message = "Deploying documentation for #{project}, tag #{tag}."
        elsif !branch.empty?
          t.destination = "#{doc_root}/branch/#{branch}"
          t.message = "Deploying documentation for #{project}, branch #{branch}."
        else
          abort 'No tag or branch specified'
        end

        t.json_sitemap(
          directory: doc_root,
          whitelist: ['**/_index.html', '**/index_html'],
          output: "#{project_root}/documentation.json"
        )
      end
    else
      task :deploy do
        puts 'Documentation not generated for pull requests.'
      end
    end
  end
end
