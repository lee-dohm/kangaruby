#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the symbol ending a lifeline.
  class LifelineTail
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
    # @return [Array] Minimum width and height of the tail symbol.
    def minimum_size
      [10, 10]
    end

    private

    # Adds the symbol to the supplied group element, centered within the given `Rect`.
    #
    # @param [Nokogiri::XML::Element] g Group element within which to insert the symbol.
    # @param [Rect] rect Bounding box within which to draw.
    def add_symbol(g, rect)
      rect = center(rect, 10, 10)

      g.add_child(g.document.create_element 'line', x1: rect.left, y1: rect.top, x2: rect.right, y2: rect.bottom)
      g.add_child(g.document.create_element 'line', x1: rect.right, y1: rect.top, x2: rect.left, y2: rect.bottom)
    end

    # Creates a new rectangle of the given `width` and `height` centered within `rect`.
    #
    # @param [Rect] Bounding box within which to center the new rectangle.
    # @param width Width of the new rectangle.
    # @param height Height of the new rectangle.
    # @return [Rect] New bounding box.
    def center(rect, width, height)
      x = (rect.right - rect.left - width) / 2 + rect.left
      y = (rect.bottom - rect.top - height) / 2 + rect.top

      Rect.new x, y, width, height
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
