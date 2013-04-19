#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'ttfunk'

module KangaRuby
  # Embodies a TrueType font, allowing for calculation of visual sizes of strings.
  class Font
    # Opens the given font.
    #
    # @param [String] path Path to the font.
    def initialize(path)
      @font = TTFunk::File.open(path)
    end

    # Gets the name of the font.
    #
    # @return [String] Name of the font family.
    def name
      @font.name.postscript_name
    end
  end
end
