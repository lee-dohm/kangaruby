#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'ttfunk'

module KangaRuby
  # Represents error that occurs when a font does not contain a Unicode map.
  class MissingUnicodeMapError < StandardError
  end

  # Embodies a TrueType font, allowing for calculation of visual sizes of strings.
  #
  # These calculations are documented, for the most part, on the
  # [FreeType Glyph Conventions](http://freetype.sourceforge.net/freetype2/docs/glyphs/index.html)
  # page.
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

    # Gets the scaled ascender value.
    #
    # @return [Float] The distance from the baseline to the highest point of a character's glyph.
    def ascender
      @ascender ||= @font.ascent * scale_factor
    end

    # Gets the scaled width for a given character code.
    #
    # @param [Fixnum] code Number representing a UTF-8 character code.
    # @return [Float] The advance width of the given character.
    def character_width(code)
      return 0 unless cmap[code]

      return 0.0 if code == 10

      @char_widths[code] ||= Integer(horizontal_metrics.widths[cmap[code]] * scale_factor)
    end

    # Gets the Unicode character map for the font.
    #
    # @return [Array] Unicode character map.
    def cmap
      @cmap ||= @font.cmap.unicode.first or raise MissingUnicodeMapError
    end

    # Gets the scaled descender value.
    #
    # @return [Float] The distance from the baseline to the lowest point of a character's glyph.
    def descender
      @descender ||= @font.descent * scale_factor
    end

    # Gets the horizontal metrics table for the font.
    #
    # @return [Array] Table of horizontal metrics.
    def horizontal_metrics
      @horizontal_metrics ||= @font.horizontal_metrics
    end

    # Gets the scaled line gap.
    #
    # @return [Float] The distance that must be placed between two lines of text.
    def line_gap
      @line_gap ||= @font.line_gap * scale_factor
    end
  end
end
