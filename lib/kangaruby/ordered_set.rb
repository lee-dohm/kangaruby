#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'delegate'

module KangaRuby
  # `OrderedSet` represents an ordered list of unique objects. It is simply an `Array` that enforces uniqueness of the items it
  # contains and supports all of the same methods.
  #
  # @see http://rubydoc.info/stdlib/core/Array Array
  class OrderedSet < DelegateClass(Array)
    # Creates a new instance of `OrderedSet`.  If given an array of items that contain duplicates, relative ordering is maintained
    # after duplicates are removed.
    #
    # @example Relative ordering
    #   set = OrderedSet.new 1, 2, 3, 2, 4, 1, 5
    #   puts set.to_s    # Outputs [1, 2, 3, 4, 5]
    #
    # @param items List of items to add to the set.
    def initialize(*items)
      @array = items.uniq
      super(@array)
    end

    # Appends a new item if it does not already exist in the set.
    #
    # @param item Item to be added.
    # @return [self] The updated set.
    def <<(item)
      @array << item unless @array.include? item

      self
    end
  end
end
