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
  #   diagram.arrows << Arrow.new(1, 2)
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
    end

    # Draws the diagram.
    #
    # @return [String] Text of the `SVG` document.
    def draw
      determine_sizes
      draw_diagram.to_s
    end

    private

    # rubocop:disable ReduceArguments
    # In this case, `sum` and `size` are more clear.

    # Determines the sizes of all the components of the diagram.
    def determine_sizes
      @lifeline_sizes = @lifelines.map { |line| line.minimum_size }
      @arrow_sizes = @arrows.map { |arrow| arrow.minimum_size }

      @width = @lifeline_sizes.reduce(0) { |sum, size| sum += size.width }
      @height = @lifeline_sizes.map { |size| size.height }.max + @arrow_sizes.reduce(0) { |sum, size| sum += size.width }
    end

    # rubocop:enable ReduceArguments

    # Uses the sizes of the various components to draw the diagram.
    def draw_diagram
      doc = Nokogiri::XML::Document.new
      doc.root = doc.create_element('svg',
                                    xmlns: 'http://www.w3.org/2000/svg',
                                    version: '1.1',
                                    width: @width.to_s,
                                    height: @height.to_s)
    end
  end
end
