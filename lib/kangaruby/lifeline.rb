#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the lifetime of a participant in the diagram.
  class Lifeline
    include GraphicsUtilities

    # Reference to the head symbol.
    attr_reader :head

    # Reference to the tail symbol.
    attr_reader :tail

    # Creates a new lifeline.
    #
    # @param [String] name Name for the lifeline.
    # @param [Font] font Font object to use to draw the name.
    def initialize(name, font)
      @head = LifelineHead.new(name, font)
      @tail = LifelineTail.new
    end

    # Returns a node containing the instructions to draw the lifeline.
    #
    # @param [Rect] rect Area within which to draw the lifeline.
    # @param [Nokogiri::XML::Document] doc XML document object from which to create elements.
    # @return [Nokogiri::XML::Node] Node containing the instructions.
    def draw(rect, doc)
      g = create_group(doc)

      line, head, tail = create_symbols(rect, doc)

      g.add_child(line)
      g.add_child(head)
      g.add_child(tail)

      g
    end

    # Gets the minimum size of the lifeline in pixels.
    #
    # @return [Array] Minimum size width and height in pixels.
    def minimum_size
      w = [@head.minimum_size[0], @tail.minimum_size[0]].max
      h = @head.minimum_size[1] + @tail.minimum_size[1]

      [w, h]
    end

    # Gets the name for the lifeline.
    #
    # @return [String] Name of the lifeline.
    def name
      @head.name
    end

    private

    # Creates a group element.
    #
    # @param [Nokogiri::XML::Document] doc Document object to use to create elements.
    # @return [Nokogiri::XML::Element] SVG `g` element.
    def create_group(doc)
      doc.create_element('g')
    end

    # rubocop:disable ParameterLists
    # Creates a line element between the two points.
    #
    # @param [Nokogiri::XML::Document] doc Document object to use to create elements.
    # @param x1 `x` coordinate of the first point.
    # @param y1 `y` coordinate of the first point.
    # @param x2 `x` coordinate of the second point.
    # @param y2 `y` coordinate of the second point.
    # @return [Nokogiri::XML::Element] SVG `line` element.
    def create_line(doc, x1, y1, x2, y2)
      doc.create_element('line', x1: x1, y1: y1, x2: x2, y2: y2, stroke: 'black', 'stroke-width' => '1')
    end
    # rubocop:enable ParameterLists

    # Create the symbols to be drawn.
    #
    # @param [Rect] rect Area in which to draw the symbols.
    # @param [Nokogiri::XML::Document] doc Document object with which to create elements.
    # @return [Array] The `line`, `head` and `tail` symbols.
    def create_symbols(rect, doc)
      head_rect = head_pos(rect)
      tail_rect = tail_pos(rect)

      head = @head.draw(head_rect, doc)
      tail = @tail.draw(tail_rect, doc)

      x1, y1 = center_point(head_rect)
      x2, y2 = center_point(tail_rect)

      line = create_line(doc, x1, y1, x2, y2)

      [line, head, tail]
    end

    # Determines the area within which to draw the head symbol.
    #
    # @param [Rect] rect Area within which the entire lifeline is given to draw.
    # @return [Rect] Area within which to draw the head symbol.
    def head_pos(rect)
      head_size = @head.minimum_size

      x = center_x(rect, head_size.width)

      Rect.new x, rect.top, head_size.width, head_size.height
    end

    # Determines the area within which to draw the tail symbol.
    #
    # @param [Rect] rect Area within which the entire lifeline is given to draw.
    # @return [Rect] Area within which to draw the tail symbol.
    def tail_pos(rect)
      tail_size = @tail.minimum_size

      x = center_x(rect, tail_size.width)
      y = rect.bottom - tail_size.height

      Rect.new x, y, tail_size.width, tail_size.height
    end
  end
end
