#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter 'grammar/'
  add_filter 'spec/support/'
end

require 'rspec'

require 'kangaruby'

include KangaRuby

# Import support files
Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Accepts a list of arrays of parameters and returns a list of `Action`s.
#
# @param [Array] params List of arrays of parameters to pass to the `Action` constructor.
# @return [Array] List of actions.
def actions(*params)
  params.map do |param|
    Action.new(*param)
  end
end

# Creates a blank SVG document.
#
# @return [Nokogiri::XML::Document] New SVG document.
def svg
  doc = Nokogiri::XML::Document.new

  node = doc.create_element 'svg', xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: '1000', height: '1000'
  doc.add_child node

  doc
end

# Accepts a list of names and returns a list of `Participant`s.
#
# @param [Array] names Names for the participants.
# @return [Array] List of participants.
def participants(*names)
  names.map do |name|
    Participant.new(name)
  end
end
