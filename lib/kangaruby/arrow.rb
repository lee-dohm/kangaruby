#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents an action in the diagram.
  class Arrow
    # Line style to use for drawing the arrow.
    attr_reader :style

    # Creates a new arrow.
    def initialize
      @style = :solid
    end

    # Returns the minimum size of the arrow.
    #
    # @return [Array] Minimum width and height of the arrow.
    def minimum_size
      [10, 10]
    end
  end
end
