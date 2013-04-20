#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'ttfunk'

module KangaRuby
  # Represents error that occurs when a font does not contain a Unicode map.
  class MissingUnicodeMapError < StandardError
  end

  # Embodies a TrueType font, allowing for calculation of visual sizes of strings.
  class Font
    # Opens the given font.
    #
    # @param [String] path Path to the font.
    def initialize(path)
      @font = TTFunk::File.open(path)
      @char_widths = []
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

    # Height of text for the font.
    def text_height
      ascender - descender + line_gap
    end

    # Gets the width of the given string of text.
    #
    # @param [String] text Text to get the width for.
    def text_width(text)
      base_width = text.codepoints.reduce(0) do |width, code|
        width + character_width(code)
      end

      base_width * scale_factor
    end

    private

    def ascender
      @ascender ||= @font.ascent * scale_factor
    end

    def character_width(code)
      return 0 unless cmap[code]

      return 0.0 if code == 10

      @char_widths[code] ||= Integer(horizontal_metrics.widths[cmap[code]] * scale_factor)
    end

    def cmap
      @cmap ||= @font.cmap.unicode.first or raise MissingUnicodeMapError
    end

    def descender
      @descender ||= @font.descent * scale_factor
    end

    def horizontal_metrics
      @horizontal_metrics ||= @font.horizontal_metrics
    end

    def line_gap
      @line_gap ||= @font.line_gap * scale_factor
    end
  end
end
