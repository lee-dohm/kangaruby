#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

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
  builder = Nokogiri::XML::Builder.new do |xml|
    xml.svg(xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: '1000', height: '1000')
  end

  builder.doc
end
