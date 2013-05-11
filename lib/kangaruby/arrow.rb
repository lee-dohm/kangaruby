#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'kangaruby/graphics_utilities'
require 'kangaruby/xml_utilities'

module KangaRuby
  # Represents an action in the diagram.
  class Arrow
    include GraphicsUtilities
    include XmlUtilities

    # @return [Integer] Index of the lifeline from which the arrow starts.
    attr_reader :from

    # @return [Symbol] Line style to use for drawing the arrow.
    attr_reader :style

    # @return [Integer] Index of the lifeline to which the arrow points.
    attr_reader :to

    # @param [Integer] from Index of the lifeline from which the arrow starts.
    # @param [Integer] to Index of the lifeline to which the arrow points.
    # @param [Symbol] style Line style to use.
    def initialize(from, to, style = :solid)
      raise ArgumentError, 'Style must be either :solid or :dotted' unless STYLES.include? style

      @from = from
      @style = style
      @to = to
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

      if @from < @to
        draw_right(g, rect)
      else
        draw_left(g, rect)
      end

      g
    end

    private

    # Draws the arrow pointing to the left.
    #
    # @param [Nokogiri::XML::Node] g Node that will contain the arrow draw instructions.
    # @param [Rect] rect Area within which to draw the arrow.
    def draw_left(g, rect)
      add_child(g, 'line', x1: rect.left + 5, y1: center_y(rect) - 5, x2: rect.left, y2: center_y(rect))
      add_child(g, 'line', x1: rect.left + 5, y1: center_y(rect) + 5, x2: rect.left, y2: center_y(rect))
      add_child(g, 'line', x1: rect.right, y1: center_y(rect), x2: rect.left, y2: center_y(rect))
    end

    # Draws the arrow pointing to the right.
    #
    # @param [Nokogiri::XML::Node] g Node that will contain the arrow draw instructions.
    # @param [Rect] rect Area within which to draw the arrow.
    def draw_right(g, rect)
      add_child(g, 'line', x1: rect.right - 5, y1: center_y(rect) - 5, x2: rect.right, y2: center_y(rect))
      add_child(g, 'line', x1: rect.right - 5, y1: center_y(rect) + 5, x2: rect.right, y2: center_y(rect))
      add_child(g, 'line', x1: rect.left, y1: center_y(rect), x2: rect.right, y2: center_y(rect))
    end
  end
end
