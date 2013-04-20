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
  # All measurements for the font have been normalized to 1,000 units per em.  Because
  # each font can have drastically differing scales (from 16 to 16,384 units per em),
  # this allows for a unified set of math to be used for conversions to pixels or inches.
  #
  # All conversions to pixels or inches have been based off of an assumption of 72 DPI (dots
  # or pixels per inch) because that makes the math easy.  This means that 1 point (using
  # the typographic term) is equal to 1 pixel, so a 12 point font would be approximately
  # 12 pixels high.
  #
  # ## Sources
  #
  # * [FreeType Glyph Conventions](http://freetype.sourceforge.net/freetype2/docs/glyphs/index.html)
  # * [TrueType Fundamentals](http://www.microsoft.com/typography/otspec/TTCH01.htm)
  #
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

    # Visual height of one line of text.
    #
    # @param [Float] size Size of the text in points.
    # @return [Integer] Height of a line of text from baseline to baseline.
    def text_height(size)
      ((ascender - descender + line_gap) * size / 1_000.0).to_i
    end

    # Gets the width of the given string of text.
    #
    # @param [String] text Text to get the width for.
    # @param [Float] size Size of the text in points.
    # @return [Integer] Total width of the characters in pixels.
    def text_width(text, size)
      base_width = text.codepoints.reduce(0) do |width, code|
        width + character_width(code)
      end

      (base_width * size / 1_000.0).to_i
    end

    private

    # Gets the distance from the baseline to the highest point of the em-box.
    #
    # @return [Float] The ascent distance.
    def ascender
      @ascender ||= @font.ascent * scale_factor
    end

    # Gets the width for a given UTF-8 character.
    #
    # @param [Fixnum] code Number representing a UTF-8 character code.
    # @return [Float] Width of the character.
    def character_width(code)
      return 0.0 unless cmap[code]

      # Some fonts return a non-zero width for the newline character (UTF-8/ASCII code 10).
      # Work around these by always returning a zero width.
      return 0.0 if code == 10

      @char_widths[code] ||= hmtx.widths[cmap[code]] * scale_factor
    end

    # Gets the Unicode character map for the font.
    #
    # @return [Array] Unicode character map.
    def cmap
      @cmap ||= @font.cmap.unicode.first or raise MissingUnicodeMapError
    end

    # Gets the distance from the baseline to the bottomost point of the em-box.
    #
    # This is expressed as a negative number.
    #
    # @return [Float] Descent distance.
    def descender
      @descender ||= @font.descent * scale_factor
    end

    # Gets the horizontal metrics table for the font.
    #
    # @return [Array] Table of horizontal metrics.
    def hmtx
      @hmtx ||= @font.horizontal_metrics
    end

    # Gets the recommended gap to place between lines of text.
    #
    # @return [Float] Line gap.
    def line_gap
      @line_gap ||= @font.line_gap * scale_factor
    end

    # Gets the scale factor for the font.
    #
    # @return [Float] Ratio of the size of this font to the standard size.
    def scale_factor
      @scale ||= 1_000.0 / @font.header.units_per_em
    end
  end
end
