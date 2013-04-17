#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Parses the diagram source and creates the in-memory model.
  class Parser
    # Parses the diagram source and returns the in-memory model.
    #
    # @param source A String or an IO object containing the source to parse.
    # @return In-memory model representing the source document.
    def parse(source)
      raise ArgumentError
    end
  end
end
