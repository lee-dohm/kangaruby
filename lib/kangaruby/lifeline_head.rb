#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the symbol at the start of the lifeline.
  class LifelineHead
    include GraphicsUtilities

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

    # Draws the symbol centered in `rect`.
    #
    # @param [Rect] rect Bounding box to draw within.
    # @param [Nokogiri::XML::Document] doc Document to use to generate elements.
    # @return [Nokogiri::XML::Element] SVG group element containing the drawing instructions for the symbol.
    def draw(rect, doc)
      text_pos = center_text(rect)

      g = doc.create_element 'g', stroke: 'black'

      add_new_child(g, 'rect', x: rect.x, y: rect.y, width: rect.width, height: rect.height, fill: 'white')
      add_new_child(g, 'text', @name, x: text_pos[0], y: text_pos[1], 'font-family' => @font.name, 'font-size' => @font_size)

      g
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

    def add_new_child(element, *args)
      element.add_child(element.document.create_element(*args))
    end

    def center_text(rect)
      x = (rect.right - rect.left - text_width) / 2 + rect.left
      y = (rect.bottom - rect.top) / 2 + rect.top + @font_size / 2

      [x, y]
    end

    def text_height
      @font.text_height(@font_size)
    end

    def text_width
      @font.text_width(@name, @font_size)
    end
  end
end
