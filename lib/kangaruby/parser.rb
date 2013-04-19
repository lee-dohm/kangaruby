#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Parses the diagram source and creates the in-memory model.
  class Parser
    def initialize
      @parser = SequenceDiagramParser.new
    end

    # Parses the diagram source and returns the in-memory model.
    #
    # @param [String] source Diagram source to parse.
    # @return [Model] In-memory model representing the source document.
    # @raise [ArgumentError] When `source` is `nil`.
    def parse(source)
      raise ArgumentError, 'source cannot be nil' if source.nil?

      tree = @parser.parse(source)

      model = Model.new

      tree.activities.each do |activity|
        model.participants << activity.from
        model.participants << activity.to

        model.activities << Activity.new(activity.from, activity.to, activity.style)
      end

      model
    end
  end
end
