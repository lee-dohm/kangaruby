#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the symbol ending a lifeline.
  class LifelineTail
    include GraphicsUtilities

    # Draws the lifeline tail in the area described by `rect` and inserts the drawing instructions into `node`.
    #
    # @param [Nokogiri::XML::Node] node Node within which to place the drawing instructions.
    # @param [Rect] rect Bounding box within which to draw.
    # @return [void]
    def draw(node, rect)
      g = node.add_child(node.document.create_element('g', stroke: 'black', 'stroke-width' => '1'))

      draw_symbol(g, rect)
    end

    # Returns the minimum size of the tail symbol.
    #
    # @return [Size] Minimum width and height of the tail symbol.
    def minimum_size
      @size ||= Size.new 10, 10
    end

    private

    # Adds the symbol to the supplied group element, centered within the given `Rect`.
    #
    # @param [Nokogiri::XML::Element] g Group element within which to insert the symbol.
    # @param [Rect] rect Bounding box within which to draw.
    # @return [void]
    def draw_symbol(g, rect)
      rect = center(rect, minimum_size.width, minimum_size.height)

      Nokogiri::XML::Builder.with(g) do |xml|
        xml.line(x1: rect.left, y1: rect.top, x2: rect.right, y2: rect.bottom)
        xml.line(x1: rect.right, y1: rect.top, x2: rect.left, y2: rect.bottom)
      end
    end
  end
end
