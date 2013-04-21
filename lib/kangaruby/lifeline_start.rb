#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the symbol at the start of the lifeline.
  class LifelineStart
    # Name to show in the box.
    attr_reader :name

    # Initializes the start box for the lifeline.
    #
    # @param [String] name Name for the lifeline.
    # @param [Font] font Font to use for size calculations.
    def initialize(name, font)
      @name = name
      @font = font
    end
  end
end
