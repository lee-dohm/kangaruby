#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Creates a diagram and writes it out to an `SVG` file.  A diagram is represented by a collection of objects.
  class Diagram
    # Set of actions in the diagram, from top to bottom.
    attr_reader :actions

    # Set of lifelines in the diagram, from left to right.
    attr_reader :lifelines

    # Creates an empty diagram.
    def initialize
      @actions = []
      @lifelines = []
    end
  end
end
