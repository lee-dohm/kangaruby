#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the lifetime of a participant in the diagram.
  class Lifeline
    # Reference to the head symbol.
    attr_reader :head

    # Reference to the tail symbol.
    attr_reader :tail

    # Creates a new lifeline.
    #
    # @param [String] name Name for the lifeline.
    # @param [Font] font Font object to use to draw the name.
    def initialize(name, font)
      @head = LifelineHead.new(name, font)
      @tail = LifelineTail.new
    end

    # Gets the minimum size of the lifeline in pixels.
    #
    # @return [Array] Minimum size width and height in pixels.
    def minimum_size
      w = [@head.minimum_size[0], @tail.minimum_size[0]].max
      h = @head.minimum_size[1] + @tail.minimum_size[1]

      [w, h]
    end

    # Gets the name for the lifeline.
    #
    # @return [String] Name of the lifeline.
    def name
      @head.name
    end
  end
end
