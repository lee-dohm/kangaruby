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

    def determine_sizes
    end

    def draw_diagram
    end
  end
end
