#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents an ordered list of unique objects.
  class OrderedSet
    include Enumerable

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
    # @return [OrderedSet] The updated set.
    def <<(item)
      @array << item unless @array.include? item

      self
    end

    # Determines if `other` is equal to this set.
    #
    # @param [Enumerable] other A list of items.
    # @return [Boolean] `true` if they are equivalent; `false` otherwise.
    def ==(other)
      return false unless count == other.count

      other.each_with_index { |v, i| return false unless v == self[i] }

      true
    end

    # Returns the number of items in the set.
    #
    # @return [Integer] Number of items in the set.
    def count
      @array.count
    end

    # Calls the given block once for each item in the set, passing that element as a parameter.
    #
    # @yieldparam item Item in the set.
    def each
      @array.each { |item| yield item }
    end

    # Outputs a debug view of the set.
    #
    # @return [String] A view of the set most useful for debugging.
    def inspect
      @array.inspect
    end
  end
end
