#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

if ENV['TRAVIS'] || ENV['COVERAGE']
  require 'simplecov'

  if ENV['TRAVIS']
    require 'coveralls'
    SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  end

  SimpleCov.start do
    add_filter 'grammar/'
    add_filter 'spec/'
  end
end

require 'equivalent-xml'
require 'factory_girl'
require 'rspec'

require 'kangaruby'

include KangaRuby

# Import support files
Dir[File.join(File.dirname(__FILE__), 'support', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

FactoryGirl.find_definitions
