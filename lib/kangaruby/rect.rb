#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents a rectangle in the coordinate space.
  class Rect
    # @return [Integer] `x` coordinate of the upper-left corner.
    attr_reader :x

    # @!attribute [r] left
    #   @return [Integer] Leftmost coordinate.
    attr_alias :left, :x

    # @return [Integer] `y` coordinate of the upper-left corner.
    attr_reader :y

    # @!attribute [r] top
    #   @return [Integer] Topmost coordinate.
    attr_alias :top, :y

    # @return [Integer] Width of the rectangle.
    attr_reader :width

    # @return [Integer] Height of the rectangle.
    attr_reader :height

    # Creates a new rectangle.
    # @overload initialize(x = 0, y = 0, width = 0, height = 0)
    #   @param [Integer] x X-coordinate of the upper-left corner of the rectangle.
    #   @param [Integer] y Y-coordinate of the upper-left corner of the rectangle.
    #   @param [Integer] width Width of the rectangle.
    #   @param [Integer] height Height of the rectangle.
    # @overload initialize(array)
    #   @param [Array<(Integer, Integer, Integer, Integer)>] array `x`, `y`, `width` and `height` values.
    # @raise [ArgumentError] if too few or too many arguments are supplied.
    def initialize(*args)
      args.flatten!
      raise ArgumentError, 'Must supply zero or four arguments' unless args.count == 0 || args.count == 4

      @x = args[0] || 0
      @y = args[1] || 0
      @width = args[2] || 0
      @height = args[3] || 0
    end

    # @return [Integer] Rightmost coordinate.
    # @!attribute [r] right
    def right
      @x + @width
    end

    # @return [Integer] Bottommost coordinate.
    # @!attribute [r] bottom
    def bottom
      @y + @height
    end
  end
end
