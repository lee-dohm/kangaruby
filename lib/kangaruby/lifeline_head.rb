#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'kangaruby/xml_utilities'

module KangaRuby
  # Represents the symbol at the start of the lifeline.
  class LifelineHead
    include GraphicsUtilities
    include XmlUtilities

    # Defaults for various values.
    DEFAULTS = {
      border:     1,
      font_size: 12,
      margin:     0,
      padding:    0
    }

    # Box border width in pixels.
    attr_reader :border

    # Font to use to draw the name.
    attr_reader :font

    # Size of the font to use to draw the name.
    attr_reader :font_size

    # Name to show in the box.
    attr_reader :name

    # Whitespace border outside the box in pixels.
    attr_reader :margin

    # Whitespace between the box and the name in pixels.
    attr_reader :padding

    # Initializes the start box for the lifeline.
    #
    # @param [String] name Name for the lifeline.
    # @param [Font] font Font to use for size calculations.
    # @param [Hash] opts Optional arguments.
    # @option opts [Integer] :border Box border width in pixels.
    # @option opts [Integer] :font_size Font size for the name.
    # @option opts [Integer] :margin Border outside the box in pixels.
    # @option opts [Integer] :padding Inside border between the box and the name in pixels.
    def initialize(name, font, opts = {})
      @name = name
      @font = font

      opts = DEFAULTS.merge opts

      @border = opts[:border]
      @font_size = opts[:font_size]
      @margin = opts[:margin]
      @padding = opts[:padding]
    end

    # Draws the lifeline head in the area described by `rect` and inserts itself into `node`.
    #
    # @param [Nokogiri::XML::Document] node Document to use to generate elements.
    # @param [Rect] rect Bounding box to draw within.
    def draw(node, rect)
      text_pos = center_text(rect, text_width, @font_size)

      g = add_child(node, 'g', stroke: 'black')

      add_child(g, 'rect', x: rect.x, y: rect.y, width: rect.width, height: rect.height, fill: 'white')
      add_child(g, 'text', @name, x: text_pos[0], y: text_pos[1], 'font-family' => @font.name, 'font-size' => @font_size)
    end

    # Gets the minimum size that the element can be drawn with the given parameters.
    #
    # @return [Size] Minimum width and height to properly draw the symbol.
    def minimum_size
      width = text_width
      height = text_height

      width += 2 * @border + 2 * @margin + 2 * padding
      height += 2 * @border + 2 * @margin + 2 * padding

      Size.new width, height
    end

    private

    def text_height
      @font.text_height(@font_size)
    end

    def text_width
      @font.text_width(@name, @font_size)
    end
  end
end
