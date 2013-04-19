#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'bundler/gem_tasks'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'yard'

CLEAN.include('.yardoc')
CLOBBER.include('doc', 'pkg')

task :default => [:tt, :rubocop, :spec, :yard]

task :tt do
  sh 'tt grammar/sequence.treetop -o grammar/sequence_parser.rb'
end

task :rubocop do
  sh 'rubocop lib spec'
end

desc "Execute all tests"
task :test => [:spec]

RSpec::Core::RakeTask.new(:spec)

YARD::Rake::YardocTask.new
