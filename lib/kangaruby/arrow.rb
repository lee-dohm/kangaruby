#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents an action in the diagram.
  class Arrow
    # @return [Symbol] Line style to use for drawing the arrow.
    attr_reader :style

    # @param [Symbol] style Line style to use.
    def initialize(style = :solid)
      @style = style
    end

    # Returns the minimum size of the arrow.
    #
    # @return [Size] Minimum size of the arrow.
    def minimum_size
      Size.new 10, 10
    end

    # Draws the arrow.
    #
    # @param [Rect] rect Area within which to draw the arrow.
    # @param [Nokogiri::XML::Document] doc Document used to create elements.
    # @return [Nokogiri::XML::Node] Instructions for drawing the arrow.
    def draw(rect, doc)
      g = doc.create_element 'g', stroke: 'black', 'stroke-width' => '1'

      g
    end
  end
end
