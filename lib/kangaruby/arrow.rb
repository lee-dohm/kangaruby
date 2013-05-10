#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents an action in the diagram.
  class Arrow
    include GraphicsUtilities

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

      add_child(g, 'line', x1: rect.right - 5, y1: center_y(rect) - 5, x2: rect.right, y2: center_y(rect))
      add_child(g, 'line', x1: rect.right - 5, y1: center_y(rect) + 5, x2: rect.right, y2: center_y(rect))
      add_child(g, 'line', x1: rect.left, y1: center_y(rect), x2: rect.right, y2: center_y(rect))

      g
    end

    private

    def add_child(element, *args)
      element.add_child(element.document.create_element(*args))
    end
  end
end
