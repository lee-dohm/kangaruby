#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents an ordered set of unique objects.
  class OrderedSet
    # Initializes the set.
    #
    # @param items List of items to add to the set.
    def initialize(*items)
      @array = items.uniq
    end

    # Retrieves the object at the given index.
    #
    # @param index Index of the object to retrieve.
    # @return Object at the given index.
    def [](index)
      @array[index]
    end

    # Appends a new item to the set if it does not already exist in the set.
    #
    # @param item Item to be added.
    # @return The updated set.
    def <<(item)
      @array << item unless @array.include? item

      self
    end

    # Returns the number of items in the set.
    def count
      @array.count
    end
  end
end
