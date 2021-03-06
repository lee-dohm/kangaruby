#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'ttfunk'
require 'kangaruby/constants'

module KangaRuby
  # Represents error that occurs when a font does not contain a Unicode character map.
  class MissingUnicodeMapError < StandardError
  end

  # Embodies a TrueType font, allowing for calculation of visual sizes of strings.
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
    # If the name of the font is given, it is loaded from the default font directory. The name is assumed to be the base name of the
    # file, i.e. the name of the file without path or extension.
    #
    # If a path is given, the font is loaded from that location. Relative paths are loaded relative to the current working
    # directory.
    #
    # @param [String] name_or_path Name of the font or the path to it.
    def initialize(name_or_path)
      if name_or_path =~ /\.ttf$/
        @font = TTFunk::File.open(name_or_path)
      else
        @font = TTFunk::File.open(File.join(KangaRuby::FONTS_DIR, name_or_path + '.ttf'))
      end

      @char_widths = nil
    end

    # Determines if `other` is equivalent to this font.
    #
    # An object is considered to be equivalent if it is a `Font` and has the same `name` as this object.
    #
    # @param [Font] other `Font` to be compared to.
    # @return [Boolean] Flag indicating if `other` is equivalent to this object.
    def ==(other)
      other.kind_of?(Font) && name == other.name
    end

    # Gets the name of the font.
    #
    # @return [String] Name of the font.
    def name
      @name ||= @font.name.postscript_name
    end

    # Visual height of one line of text at a certain size.
    #
    # @param [Integer] size Size of the text in points.
    # @return [Integer] Height of a line of text in pixels.
    def text_height(size)
      ((ascender - descender + line_gap) * size / ppem).to_i
    end

    # Visual width of a string of text at a certain size.
    #
    # @param [String] text Text to get the width for.
    # @param [Integer] size Size of the text in points.
    # @return [Integer] Total width of the characters in pixels.
    def text_width(text, size)
      base_width = text.codepoints.reduce(0) do |width, code|
        width + character_width(code)
      end

      (base_width * size / ppem).to_i
    end

    private

    # Gets the distance from the baseline to the highest point of the em-box.
    #
    # @return [Integer] The ascent distance.
    def ascender
      @ascender ||= @font.ascent
    end

    # Gets the width for a given UTF-8 character.
    #
    # @param [Fixnum] code Number representing a UTF-8 character code.
    # @return [Integer] Width of the character.
    def character_width(code)
      return 0 unless cmap[code]

      # Some fonts return a non-zero width for the newline character (UTF-8/ASCII code 10).
      # Work around these by always returning a zero width.
      return 0 if code == 10

      @char_widths = [] if @char_widths.nil?
      @char_widths[code] ||= hmtx.widths[cmap[code]]
    end

    # Gets the Unicode character map for the font.
    #
    # @return [Array] Unicode character map.
    def cmap
      raise MissingUnicodeMapError unless @cmap ||= @font.cmap.unicode.first
      @cmap
    end

    # Gets the distance from the baseline to the bottomost point of the em-box.  This
    # is expressed as a negative number.
    #
    # @return [Integer] Descent distance.
    def descender
      @descender ||= @font.descent
    end

    # Gets the horizontal metrics table for the font.
    #
    # @return [Array] Table of horizontal metrics.
    def hmtx
      @hmtx ||= @font.horizontal_metrics
    end

    # Gets the recommended gap to place between lines of text.
    #
    # @return [Integer] Line gap.
    def line_gap
      @line_gap ||= @font.line_gap
    end

    # Gets the number of font scale units per `em`, defined as the distance from the bottom
    # to the top of the maximum-size bounding box.  Different glyphs may have different
    # size bounding boxes, but there is one "maximum" size per font.
    #
    # @return [Integer] Units per `em`.
    def ppem
      @ppem ||= @font.header.units_per_em
    end
  end
end
