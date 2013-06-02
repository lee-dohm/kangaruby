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

CLEAN.include('.yardoc', '*.log')
CLOBBER.include('doc', 'pkg')

# Standard tasks
task :default => [:compile, :test, :doc]
task :ci => [:compile, :test]

task :compile => 'grammar/sequence_parser.rb'

desc 'Execute all tests'
task :test => ['test:rubocop', 'test:coverage']

desc 'Generate documentation'
task :doc => ['doc:yard']

file 'grammar/sequence_parser.rb' => 'grammar/sequence.treetop' do
  sh 'tt grammar/sequence.treetop -o grammar/sequence_parser.rb'
end

namespace 'test' do
  desc 'Run style checks'
  task :rubocop do
    sh 'rubocop'
  end

  desc 'Execute specs with code coverage'
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['test:spec'].execute
  end

  RSpec::Core::RakeTask.new do |spec|
    spec.verbose = false
  end
end

namespace 'doc' do
  # @return [Array<String>] Set of file dependencies that should trigger a regeneration of the .yardopts file.
  def deps
    ['Rakefile', 'lib/kangaruby/version.rb']
  end

  # @return [Array<String>] Set of additional files to add to the YARD-generated documentation.
  def docs
    Dir['*.md', 'documentation/**/*'].reject { |f| f == 'README.md' }
  end

  YARD::Rake::YardocTask.new do |yard|
    yard.options = %w(--yardopts .yardopts-local)
  end
  task :yard => ['.yardopts', '.yardopts-local']


  file '.yardopts' => docs + deps do
    puts yellow('Rewriting .yardopts')

    opts = []
    opts << '--markup markdown'
    opts << "--title 'KangaRuby #{KangaRuby::VERSION} Documentation'"
    opts << '--no-private'
    opts << '-'
    opts << docs
    opts.flatten!

    File.open('.yardopts', 'w') do |file|
      file.puts opts
    end
  end

  file '.yardopts-local' => docs + deps do
    puts yellow('Rewriting .yardopts-local')

    opts = []
    opts << '--markup markdown'
    opts << "--title 'KangaRuby #{KangaRuby::VERSION} Documentation'"
    opts << '--private'
    opts << '-'
    opts << docs
    opts.flatten!

    File.open('.yardopts-local', 'w') do |file|
      file.puts opts
    end
  end
end
