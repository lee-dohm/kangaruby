#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'kangaruby/graphics_utilities'

module KangaRuby
  # Acceptable list of arrow directions.
  DIRECTIONS = [:left, :right]

  # Represents an action in the diagram.
  class Arrow
    include GraphicsUtilities

    # @return [Symbol] Direction the arrow is pointing.
    attr_reader :direction

    # @return [Symbol] Line style to use for drawing the arrow.
    attr_reader :style

    # @param [Symbol] direction Direction for the arrow to point.
    # @param [Symbol] style Line style to use.
    def initialize(direction, style = :solid)
      raise ArgumentError, 'Direction must be either :left or :right' unless DIRECTIONS.include? direction
      raise ArgumentError, 'Style must be either :solid or :dotted' unless STYLES.include? style

      @direction = direction
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

      if @direction == :right
        draw_right(g, rect)
      else
        draw_left(g, rect)
      end

      g
    end

    private

    def add_child(element, *args)
      element.add_child(element.document.create_element(*args))
    end

    def draw_left(g, rect)
      add_child(g, 'line', x1: rect.left + 5, y1: center_y(rect) - 5, x2: rect.left, y2: center_y(rect))
      add_child(g, 'line', x1: rect.left + 5, y1: center_y(rect) + 5, x2: rect.left, y2: center_y(rect))
      add_child(g, 'line', x1: rect.right, y1: center_y(rect), x2: rect.left, y2: center_y(rect))
    end

    def draw_right(g, rect)
      add_child(g, 'line', x1: rect.right - 5, y1: center_y(rect) - 5, x2: rect.right, y2: center_y(rect))
      add_child(g, 'line', x1: rect.right - 5, y1: center_y(rect) + 5, x2: rect.right, y2: center_y(rect))
      add_child(g, 'line', x1: rect.left, y1: center_y(rect), x2: rect.right, y2: center_y(rect))
    end
  end
end
