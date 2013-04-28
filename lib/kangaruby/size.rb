#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Describes the width and height of a graphical object.
  class Size
    # @return [Integer] Height of the object.
    attr_reader :height

    # @return [Integer] Width of the object.
    attr_reader :width

    # Creates a size description of a graphical object.
    #
    # @overload initialize(width = 0, height = 0)
    #   @param [Integer] width Width of the object.
    #   @param [Integer] height Height of the object.
    # @overload initialize(array)
    #   @param [Array<(Integer, Integer)>] array Width and height of the object.
    def initialize(*args)
      args = args.flatten

      @width = args[0] || 0
      @height = args[1] || 0
    end

    # Gets the width or height as an index.
    #
    # @param [Integer] index `0` for width or `1` for height.  Any other index returns `nil`.
    # @return [Integer, nil] Requested dimension or `nil` if the index is out of range.
    def [](index)
      case index
      when 0 then @width
      when 1 then @height
      else nil
      end
    end

    # Determines if `other` is equivalent to this object.
    #
    # @param other Object to compare this one to.
    # @return [Boolean] `true` if they are equivalent, `false` if they are not.
    def ==(other)
      case other
      when Size
        @width == other.width && @height == other.height
      when Array
        other.count == 2 && @width == other[0] && @height == other[1]
      else
        false
      end
    end
  end
end
