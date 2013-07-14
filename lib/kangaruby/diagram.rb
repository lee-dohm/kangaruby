#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Creates a diagram by constructing an `SVG` document and returning it as a string.
  #
  # @example Basic flow
  #   diagram = Diagram.new
  #
  #   diagram.lifelines << Lifeline.new('Alice')
  #   diagram.lifelines << Lifeline.new('Bob')
  #   diagram.arrows << Arrow.new(0, 1)
  #
  #   diagram.draw
  class Diagram
    # Set of arrows in the diagram, from top to bottom.
    attr_reader :arrows

    # Set of lifelines in the diagram, from left to right.
    attr_reader :lifelines

    # Creates an empty diagram.
    def initialize
      @arrows = []
      @lifelines = []
      @width = @height = 0
    end

    # Draws the diagram.
    #
    # @return [String] Text of the SVG document.
    def draw
      determine_sizes
      draw_diagram.to_s
    end

    private

    # rubocop:disable ReduceArguments
    # In this case, `sum` and `size` are more clear.

    # Determines the sizes of all the components of the diagram.
    # @return [void]
    def determine_sizes
      unless @lifelines.empty?
        @lifeline_sizes = @lifelines.map { |line| line.minimum_size }
        @arrow_sizes = @arrows.map { |arrow| arrow.minimum_size }

        @width = @lifeline_sizes.reduce(0) { |sum, size| sum += size.width }
        @height = (@lifeline_sizes.map { |size| size.height }).max + @arrow_sizes.reduce(0) { |sum, size| sum += size.height }
      end
    end

    # rubocop:enable ReduceArguments

    # Uses the sizes of the various components to draw the diagram.
    # @return [Nokogiri::XML::Document] XML containing the drawn diagram.
    def draw_diagram
      doc = Nokogiri::XML::Document.new
      doc.root = doc.create_element('svg',
                                    xmlns: 'http://www.w3.org/2000/svg',
                                    version: '1.1',
                                    width: @width.to_s,
                                    height: @height.to_s)

      draw_lines(doc.root)
      draw_arrows(doc.root)

      doc
    end

    # Draw the lifelines in the diagram.
    #
    # @param [Nokogiri::XML::Node] node Node into which to draw the lifelines.
    # @return [void]
    def draw_lines(node)
      left = 0

      @lifeline_rects = []
      @lifelines.each_with_index do |line, i|
        size = @lifeline_sizes[i]
        rect = Rect.new(left, 0, size.width, @height)
        @lifeline_rects << rect
        line.draw(node, rect)
        left += size.width
      end
    end

    # Draw the arrows in the diagram.
    #
    # @param [Nokogiri::XML::Node] node Node into which to draw the arrows.
    # @return [void]
    def draw_arrows(node)
      top = 0

      @arrows.each_with_index do |arrow, i|
        left_rect, right_rect = rects_for_arrow(arrow)

        top += @lifelines.map { |line| line.head_height }.max if i == 0

        left = left_rect.left + left_rect.width / 2
        width = (right_rect.left + right_rect.width / 2) - left
        height = arrow.minimum_size.height

        arrow.draw(node, Rect.new(left, top, width, height))

        top += height
      end
    end

    # Get the left and right `Rects` of the lifelines for the given `Arrow`.
    #
    # @param [Arrow] arrow Arrow for which to get the lifeline rects.
    # @return [Array(Rect, Rect)] The left and right `Lifeline` `Rects`.
    def rects_for_arrow(arrow)
      left_index, right_index = [arrow.from, arrow.to].minmax
      [@lifeline_rects[left_index], @lifeline_rects[right_index]]
    end
  end
end
