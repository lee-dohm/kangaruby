#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

if ENV['TRAVIS'] || ENV['COVERAGE']
  require 'simplecov'
  require 'coveralls'

  if ENV['TRAVIS']
    require 'coveralls'
    SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  end

  SimpleCov.start do
    add_filter 'grammar/'
    add_filter 'spec/support/'
  end
end

require 'rspec'

require 'equivalent-xml'
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

# Creates an XML document object from the given text.
#
# @param [String] text XML document description.
# @return [Nokogiri::XML::Document] XML document reperesentation of the text.
def create_doc(text)
  Nokogiri::XML.parse(text)
end

# Creates a `Nokogiri::XML::Node` from the given text.
#
# @param [String] text XML node description.
# @return [Nokogiri::XML::Node] XML node representation of the text.
def create_node(text)
  Nokogiri::XML.parse(text).children.first
end

# Creates a blank SVG document.
#
# @return [Nokogiri::XML::Document] New SVG document.
def svg
  doc = Nokogiri::XML::Document.new

  doc.root = doc.create_element 'svg', xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: '1000', height: '1000'

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
