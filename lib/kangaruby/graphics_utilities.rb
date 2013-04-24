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
    def center(rect, width, height)
      x = (rect.right - rect.left - width) / 2 + rect.left
      y = (rect.bottom - rect.top - height) / 2 + rect.top

      Rect.new x, y, width, height
    end
  end
end
