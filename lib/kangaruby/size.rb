#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Describes the width and height of a graphical object.
  class Size
    # Height of the object.
    attr_reader :height

    # Width of the object.
    attr_reader :width

    # Creates a size description of a graphical object.
    #
    # @param [Array] args Variable number of arguments.
    def initialize(*args)
      args = args.flatten

      @width = args[0] || 0
      @height = args[1] || 0
    end

    # Gets the width or height as an index.
    #
    # @param index `0` for width or `1` for height.  Any other index returns `nil`.
    # @return Requested dimension or `nil`.
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
    # @return `true` if they are equivalent, `false` if they are not or `nil` if the comparison is invalid.
    def ==(other)
      case other
      when Size
        @width == other.width && @height == other.height
      when Array
        other.count == 2 && @width == other[0] && @height == other[1]
      else
        nil
      end
    end
  end
end
