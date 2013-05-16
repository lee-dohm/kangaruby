#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the lifetime of a participant in the diagram.
  class Lifeline
    include GraphicsUtilities

    # @return [LifelineHead] Reference to the head symbol.
    attr_reader :head

    # @return [LifelineTail] Reference to the tail symbol.
    attr_reader :tail

    # Creates a new lifeline.
    #
    # @param [String] name Name for the lifeline.
    # @param [Font] font Font object to use to draw the name.
    def initialize(name, font)
      @head = LifelineHead.new(name, font)
      @tail = LifelineTail.new
    end

    # Draws the lifeline within the area defined by `rect` and inserts it into `node`.
    #
    # @param [Nokogiri::XML::Node] node Node within which to insert the drawing instructions.
    # @param [Rect] rect Area within which to draw the lifeline.
    # @return [nil]
    def draw(node, rect)
      g = node.document.create_element('g')
      node << g

      draw_lifeline(g, rect)

      nil
    end

    # Gets the minimum size of the lifeline in pixels.
    #
    # @return [Array] Minimum size width and height in pixels.
    def minimum_size
      w = [@head.minimum_size[0], @tail.minimum_size[0]].max
      h = @head.minimum_size[1] + @tail.minimum_size[1]

      Size.new(w, h)
    end

    # Gets the name for the lifeline.
    #
    # @return [String] Name of the lifeline.
    def name
      @head.name
    end

    private

    # Draws the head, lifeline and tail within the area given by `rect` and inserts the instructions into `node`.
    #
    # @param [Nokogiri::XML::Node] node Node within which to insert the drawing instructions.
    # @param [Rect] rect Area in which to draw the symbols.
    # @return [nil]
    def draw_lifeline(node, rect)
      head_rect = head_pos(rect)
      tail_rect = tail_pos(rect)

      x1, y1 = center_point(head_rect)
      x2, y2 = center_point(tail_rect)

      node << node.document.create_element('line', x1: x1, y1: y1, x2: x2, y2: y2, stroke: 'black', 'stroke-width' => '1')

      @head.draw(node, head_rect)
      @tail.draw(node, tail_rect)

      nil
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
