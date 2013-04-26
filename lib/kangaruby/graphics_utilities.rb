#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # A mixin of utility methods useful to all graphical objects.
  module GraphicsUtilities
    # Creates a new rectangle of the given `width` and `height` centered within `rect`.
    #
    # @param [Rect] rect Bounding box within which to center the new rectangle.
    # @param width Width of the new rectangle.
    # @param height Height of the new rectangle.
    # @return [Rect] New bounding box.
    # @raise ArgumentError If `rect`, `width` or `height` is nil.
    def center(rect, width, height)
      raise ArgumentError, 'rect cannot be nil' if rect.nil?
      raise ArgumentError, 'width cannot be nil' if width.nil?
      raise ArgumentError, 'height cannot be nil' if height.nil?

      x = (rect.right - rect.left - width) / 2 + rect.left
      y = (rect.bottom - rect.top - height) / 2 + rect.top

      Rect.new x, y, width, height
    end

    # Determines the `x` and `y` coordinates to use for an SVG `text` element to center some text within the given rectangle.
    #
    # The standard `center` algorithm does not work for centering text because SVG uses the given `y` coordinate for the baseline of
    # the text, thereby placing the text too high.  Giving a `y` coordinate that is half of the font size in pixels downward from
    # the center of `rect` gives the proper positioning of the text string.
    #
    # @param [Rect] rect Space within which to center the text.
    # @param text_width Width of the text in pixels.
    # @param font_size Size of the font in pixels.
    # @return [Array] `x` and `y` coordinates to use for the `text` element.
    def center_text(rect, text_width, font_size)
      raise ArgumentError, 'rect cannot be nil' if rect.nil?
      raise ArgumentError, 'text_width cannot be nil' if text_width.nil?
      raise ArgumentError, 'font_size cannot be nil' if font_size.nil?

      x = (rect.right - rect.left - text_width) / 2 + rect.left
      y = (rect.bottom - rect.top) / 2 + rect.top + font_size / 2

      [x, y]
    end
  end
end
