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

module KangaRuby
  # Directory containing the fonts for the gem.
  FONTS_DIR = File.expand_path('../../fonts', __FILE__)

  # Acceptable list of line styles.
  STYLES = [:solid, :dotted]

  # Converts `KangaRuby` text into an `SVG` graphic.
  #
  # @example Basic usage
  #   svg = KangaRuby.convert('Alice->Bob')
  #
  # @param [IO, String] input KangaRuby language description of the image.
  # @return [String] `SVG` description of the image.
  # @raise [ParseError] When there is an error parsing `input`.
  def convert(input)
    draw(parse(input))
  end

  # Draws the model.
  #
  # @param [Model] model Model describing the diagram.
  # @return [String] `SVG` description of the diagram.
  def draw(model)
    diagram = Diagram.new

    model.participants.each { |p| diagram.lifelines << Lifeline.new(p.name) }
    model.actions.each do |a|
      from_index = diagram.lifelines.find_index { |line| line.name == a.from }
      to_index = diagram.lifelines.find_index { |line| line.name == a.to }
      diagram.arrows << Arrow.new(from_index, to_index)
    end

    diagram.draw
  end

  # Parses the input into the model describing the input.
  #
  # @param [IO, String] input KangaRuby language description of the model.
  # @return [Model] Object representing the model.
  # @raise [ParseError] When there is an error parsing `input`.
  def parse(input)
    text = input.kind_of?(IO) ? input.readlines : input

    Parser.new.parse(text)
  end
end
