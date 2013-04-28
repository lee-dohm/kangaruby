#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents an action in the diagram.
  class Arrow
    # Line style to use for drawing the arrow.
    attr_reader :style

    def initialize
      @style = :solid
    end

    # Returns the minimum size of the arrow.
    #
    # @return [Size] Minimum size of the arrow.
    def minimum_size
      Size.new 10, 10
    end
  end
end
