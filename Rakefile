#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'bundler/gem_tasks'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'yard'

CLEAN.include('.yardoc')
CLOBBER.include('doc', 'pkg')

task :default => [:tt, :rubocop, :test, :yard]

task :tt do
  sh 'tt grammar/sequence.treetop -o lib/kangaruby/sequence_parser.rb'
end

desc "Execute all tests"
task :test => [:spec]

task :rubocop do
  sh 'rubocop'
end

RSpec::Core::RakeTask.new(:spec)

YARD::Rake::YardocTask.new
