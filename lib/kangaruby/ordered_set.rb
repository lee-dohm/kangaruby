#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents an ordered set of unique objects.
  class OrderedSet
    # Initializes the set.
    def initialize
      @array = []
    end

    # Returns the number of items in the set.
    def count
      @array.count
    end
  end
end
