#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'bundler/gem_tasks'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'term/ansicolor'
require 'yard'

include Term::ANSIColor

CLEAN.include('.yardoc')
CLOBBER.include('doc', 'pkg')

DOCS = Dir['*.md', 'documentation/**/*'].reject { |f| f == 'README.md' }

task :default => [:compile, :test, :yard]

task :compile => 'grammar/sequence_parser.rb'

desc 'Execute all tests'
task :test => [:static, :spec]

task :static => :rubocop

task :yard => '.yardopts'

file 'grammar/sequence_parser.rb' => 'grammar/sequence.treetop' do
  sh 'tt grammar/sequence.treetop -o grammar/sequence_parser.rb'
end

file '.yardopts' => DOCS do
  puts yellow(bold('Rewriting .yardopts'))

  opts = []
  opts << '--markup markdown'
  opts << %Q(--query '@api.text != "monkeypatch"')
  opts << '-'
  opts << DOCS
  opts.flatten!

  File.open('.yardopts', 'w') do |file|
    file.puts opts
  end
end

task :rubocop do
  sh 'rubocop lib spec'
end

RSpec::Core::RakeTask.new

YARD::Rake::YardocTask.new
