#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents a rectangle in the coordinate space.
  class Rect
    # X-coordinate of the upper-left corner.
    attr_reader :x

    # @!attribute [r] left
    #   Leftmost coordinate.
    attr_alias :left, :x

    # Y-coordinate of the upper-left corner.
    attr_reader :y

    # @!attribute [r] top
    #   Topmost coordinate.
    attr_alias :top, :y

    # Width of the rectangle.
    attr_reader :width

    # Height of the rectangle.
    attr_reader :height

    # Creates a new rectangle.
    #
    # The rectangle defaults to 0 for `x`, `y`, `width` and `height`.  Values can be supplied either directly or as an array.
    #
    # Examples:
    #
    #     rect = Rect.new(1, 2, 3, 4)
    #     rect = Rect.new [1, 2, 3, 4]
    #
    # @param x X-coordinate of the upper-left corner of the rectangle.
    # @param y Y-coordinate of the upper-left corner of the rectangle.
    # @param width Width of the rectangle.
    # @param height Height of the rectangle.
    def initialize(x = 0, y = 0, width = 0, height = 0)
      if x.kind_of? Array
        @x, @y, @width, @height = x
      else
        @x = x
        @y = y
        @width = width
        @height = height
      end
    end

    # Gets the rightmost coordinate.
    #
    # @return Right of the rectangle.
    def right
      @x + @width
    end

    # Gets the bottommost coordinate.
    #
    # @return Bottom of the rectangle.
    def bottom
      @y + @height
    end
  end
end
