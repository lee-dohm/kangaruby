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
    # @return [String] Name of the font.
    def name
      @name ||= @font.name.postscript_name
    end

    # Gets the scale factor for the font.
    #
    # @return [Float] Scale factor for the font.
    def scale_factor
      @scale ||= 1000.0 / @font.header.units_per_em
    end
  end
end
