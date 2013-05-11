#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'kangaruby/xml_utilities'

module KangaRuby
  # Represents the symbol ending a lifeline.
  class LifelineTail
    include GraphicsUtilities
    include XmlUtilities

    # Draws the tail symbol centered in the given rectangle and returns the node.
    #
    # @note This method does not add the node to the supplied document.  The document is given only to use to create elements.
    #
    # @param [Rect] rect Bounding box within which to draw.
    # @param [Nokogiri::XML::Document] doc SVG document within which to create the node.
    # @return [Nokogiri::XML::Element] Element containing the drawn symbol.
    def draw(rect, doc)
      g = group(doc)

      add_symbol(g, rect)

      g
    end

    # Returns the minimum size of the tail symbol.
    #
    # @return [Size] Minimum width and height of the tail symbol.
    def minimum_size
      Size.new 10, 10
    end

    private

    # Adds the symbol to the supplied group element, centered within the given `Rect`.
    #
    # @param [Nokogiri::XML::Element] g Group element within which to insert the symbol.
    # @param [Rect] rect Bounding box within which to draw.
    def add_symbol(g, rect)
      size = minimum_size
      rect = center(rect, size.width, size.height)

      add_child(g, 'line', x1: rect.left, y1: rect.top, x2: rect.right, y2: rect.bottom)
      add_child(g, 'line', x1: rect.right, y1: rect.top, x2: rect.left, y2: rect.bottom)
    end

    # Creates a new SVG `g` element from the document.
    #
    # @param [Nokogiri::XML::Document] doc Document object to create elements from.
    # @return [Nokogiri::XML::Element] New group element.
    def group(doc)
      doc.create_element 'g', stroke: 'black', 'stroke-width' => '1'
    end
  end
end
