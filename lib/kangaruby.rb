#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'nokogiri'

require 'sequence_parser'

require 'kangaruby/action'
require 'kangaruby/arrow'
require 'kangaruby/diagram'
require 'kangaruby/font'
require 'kangaruby/graphics_utilities'
require 'kangaruby/lifeline'
require 'kangaruby/lifeline_head'
require 'kangaruby/lifeline_tail'
require 'kangaruby/model'
require 'kangaruby/module'
require 'kangaruby/ordered_set'
require 'kangaruby/parser'
require 'kangaruby/participant'
require 'kangaruby/rect'
require 'kangaruby/size'
require 'kangaruby/version'
require 'kangaruby/xml_utilities'

module KangaRuby
  # Directory containing the fonts for the gem.
  FONTS_DIR = File.expand_path('../../fonts', __FILE__)

  # Acceptable list of line styles.
  STYLES = [:solid, :dotted]

  # Converts `KangaRuby` text into an `SVG` graphic.
  #
  # @param [String] path Path to the text.
  # @return [String] `SVG` description of the image.
  def convert(path)
    parser = Parser.new
    model = parser.parse(IO.readlines(path))

    diagram = Diagram.new

    model.participants.each { |p| diagram.lifelines << Lifeline.new(p.name) }
    model.actions.each do |a|
      from_index = diagram.lifelines.find_index { |line| line.name == a.from }
      to_index = diagram.lifelines.find_index { |line| line.name == a.to }
      diagram.arrows << Arrow.new(from_index, to_index)
    end

    diagram.draw
  end
end
