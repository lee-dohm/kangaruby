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

    # Default visual styling.
    DEFAULTS = {
      height: 10,
      style: :solid,
      width: 5
    }

    # @return [Integer] Index of the lifeline from which the arrow starts.
    attr_reader :from

    # @return [Integer] Height of the arrow head.
    attr_reader :head_height

    # @return [Integer] Width of the arrow head.
    attr_reader :head_width

    # @return [Symbol] Line style to use for drawing the arrow.
    attr_reader :style

    # @return [Integer] Index of the lifeline to which the arrow points.
    attr_reader :to

    # @param [Integer] from Index of the lifeline from which the arrow starts.
    # @param [Integer] to Index of the lifeline to which the arrow points.
    # @param [Hash] opts Optional arguments.
    # @option opts [Integer] :height Height of the arrow head.
    # @option opts [:solid, :dotted] :style Style of line for the arrow.
    # @option opts [Integer] :width Width of the arrow head.
    # @raise [ArgumentError] When the line style is not valid.
    def initialize(from, to, opts = {})
      opts = DEFAULTS.merge(opts)
      raise ArgumentError, 'Style must be either :solid or :dotted' unless STYLES.include?(opts[:style])

      @from = from
      @to = to

      @head_height = opts[:height]
      @style = opts[:style]
      @head_width = opts[:width]
    end

    # Returns the minimum size of the arrow.
    #
    # @return [Size] Minimum size of the arrow.
    def minimum_size
      Size.new(@head_width * 2, @head_height)
    end

    # Draws the arrow inside the area given by `rect` and adds it to `node`.
    #
    # @param [Nokogiri::XML::Node] node Node within which to place the drawing instructions.
    # @param [Rect] rect Area within which to draw the arrow.
    def draw(node, rect)
      g = add_child(node, 'g', stroke: 'black', 'stroke-width' => '1')

      if @from < @to
        draw_right(g, rect)
      else
        draw_left(g, rect)
      end
    end

    private

    # Draws the arrow pointing to the left.
    #
    # @param [Nokogiri::XML::Node] g Node that will contain the arrow draw instructions.
    # @param [Rect] rect Area within which to draw the arrow.
    def draw_left(g, rect)
      add_child(g, 'line', x1: rect.left + @head_width, y1: center_y(rect) - @head_height / 2, x2: rect.left, y2: center_y(rect))
      add_child(g, 'line', x1: rect.left + @head_width, y1: center_y(rect) + @head_height / 2, x2: rect.left, y2: center_y(rect))
      add_child(g, 'line', x1: rect.right, y1: center_y(rect), x2: rect.left, y2: center_y(rect))
    end

    # Draws the arrow pointing to the right.
    #
    # @param [Nokogiri::XML::Node] g Node that will contain the arrow draw instructions.
    # @param [Rect] rect Area within which to draw the arrow.
    def draw_right(g, rect)
      add_child(g, 'line', x1: rect.right - @head_width, y1: center_y(rect) - @head_height / 2, x2: rect.right, y2: center_y(rect))
      add_child(g, 'line', x1: rect.right - @head_width, y1: center_y(rect) + @head_height / 2, x2: rect.right, y2: center_y(rect))
      add_child(g, 'line', x1: rect.left, y1: center_y(rect), x2: rect.right, y2: center_y(rect))
    end
  end
end
