#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # `OrderedSet` represents an ordered list of unique objects.
  class OrderedSet
    include Enumerable

    # Creates a new instance of `OrderedSet`.  If given an array of items that contain duplicates, only relative ordering is
    # maintained.
    #
    # @param items List of items to add to the set.
    def initialize(*items)
      @array = items.uniq
    end

    # @param index Index of the object to retrieve.
    # @return [Object, nil] Object at the given index or `nil` if `index` is out of range.
    def [](index)
      @array[index]
    end

    # Appends a new item if it does not already exist in the set.
    #
    # @param item Item to be added.
    # @return [self] The updated set.
    def <<(item)
      @array << item unless @array.include? item

      self
    end

    # Determines if `other` is equal to this set.
    #
    # @param [Enumerable] other A list of items.
    # @return [Boolean] `true` if they are equivalent; `false` otherwise.
    def ==(other)
      return false unless other.kind_of? Enumerable
      return false unless count == other.count

      other.each_with_index { |v, i| return false unless v == self[i] }

      true
    end

    # @return [Integer] Number of items in the set.
    def count
      @array.count
    end

    # Calls the given block once for each item in the set in order, passing that element as a parameter.
    #
    # @yieldparam item Item from the set.
    # @return [void]
    def each
      @array.each { |item| yield item }
    end

    # @return [String] A debug view of the set.
    def inspect
      @array.inspect
    end

    # @return [String] A normal view of the set.
    def to_s
      @array.to_s
    end
  end
end
