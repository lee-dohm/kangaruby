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
    # @raise [ArgumentError] if `rect`, `width` or `height` is nil.
    def center(rect, width, height)
      raise ArgumentError, 'rect cannot be nil' if rect.nil?
      raise ArgumentError, 'width cannot be nil' if width.nil?
      raise ArgumentError, 'height cannot be nil' if height.nil?

      x, y = center_point(rect, width, height)

      Rect.new x, y, width, height
    end

    # Determines the `x` and `y` coordinates to use to center something of the given width and height.
    #
    # @param [Rect] rect Area within which to center the object.
    # @param width Width of the object to center.
    # @param height Height of the object to center.
    # @return [Array<(Integer, Integer)>] `x` and `y` coordinates to use for the object.
    def center_point(rect, width = 0, height = 0)
      x = center_x(rect, width)
      y = center_y(rect, height)

      [x, y]
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
    # @return [Array<(Integer, Integer)>] `x` and `y` coordinates to use for the `text` element.
    # @raise [ArgumentError] if `rect`, `text_width` or `font_size` are `nil`.
    def center_text(rect, text_width, font_size)
      raise ArgumentError, 'rect cannot be nil' if rect.nil?
      raise ArgumentError, 'text_width cannot be nil' if text_width.nil?
      raise ArgumentError, 'font_size cannot be nil' if font_size.nil?

      x = center_x(rect, text_width)
      y = center_y(rect) + font_size / 2

      [x, y]
    end

    # Determines the `x` coordinate to use to center something of the given `width` horizontally within `rect`.
    #
    # @param [Rect] rect Area within which to center the object.
    # @param [Integer] width Width of the object to center.
    # @return [Integer] `x` coodinate to use.
    def center_x(rect, width = 0)
      (rect.right - rect.left - width) / 2 + rect.left
    end

    # Determines the `y` coodinate to use to center something of the given `height` vertically within `rect`.
    #
    # @param [Rect] rect Area within which to center the object.
    # @param [Integer] height Height of the object to center.
    # @return [Integer] `y` coordinate to use.
    def center_y(rect, height = 0)
      (rect.bottom - rect.top - height) / 2 + rect.top
    end
  end
end
