#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'bundler/gem_tasks'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'term/ansicolor'
require 'yard'

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kangaruby/version'

include Term::ANSIColor

CLEAN.include('.yardoc')
CLOBBER.include('doc', 'pkg')

DOCS = Dir['*.md', 'documentation/**/*'].reject { |f| f == 'README.md' }

# Standard tasks
task :default => [:compile, :test, :yard]

task :ci => [:compile, :test]
task :compile => 'grammar/sequence_parser.rb'
task :static => :rubocop
desc 'Execute all tests'
task :test => [:static, :spec]

# File tasks
file 'grammar/sequence_parser.rb' => 'grammar/sequence.treetop' do
  sh 'tt grammar/sequence.treetop -o grammar/sequence_parser.rb'
end

file '.yardopts' => DOCS + ['Rakefile'] do
  puts yellow('Rewriting .yardopts')

  opts = []
  opts << '--markup markdown'
  opts << %Q(--query '@api.text != "monkeypatch"')
  opts << "--title 'KangaRuby #{KangaRuby::VERSION} Documentation'"
  opts << '-'
  opts << DOCS
  opts.flatten!

  File.open('.yardopts', 'w') do |file|
    file.puts opts
  end
end

# Library tasks
task :rubocop do
  sh 'rubocop lib spec'
end

RSpec::Core::RakeTask.new

YARD::Rake::YardocTask.new
task :yard => '.yardopts'
