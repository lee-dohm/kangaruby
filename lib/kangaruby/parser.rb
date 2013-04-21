#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents an error that occurs during parsing a diagram.
  class ParseError < StandardError
  end

  # Parses the diagram source and creates the in-memory model.
  class Parser
    # Initializes the parser.
    def initialize
      @parser = SequenceDiagramParser.new
    end

    # Parses the diagram source and returns the in-memory model.
    #
    # @param [String] source Diagram source to parse.
    # @return [Model] In-memory model representing the source document.
    # @raise [ArgumentError] When `source` is `nil`.
    # @raise [ParseError] When there is an error parsing `source`.
    def parse(source)
      raise ArgumentError, 'source cannot be nil' if source.nil?

      tree = @parser.parse(source)
      if tree.nil?
        message = "#{@parser.failure_reason} at line #{@parser.failure_line} and column #{@parser.failure_column}"
        raise ParseError, message
      end

      model = Model.new

      tree.actions.each do |action|
        model.participants << Participant.new(action.from)
        model.participants << Participant.new(action.to)

        model.actions << Action.new(action.from, action.to, action.style)
      end

      model
    end
  end
end
