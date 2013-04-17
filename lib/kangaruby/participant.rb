#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents a participant in the sequence.
  class Participant
    # Name of the participant.
    attr_reader :name

    # Initializes the participant.
    #
    # @param name Name for the participant.
    def initialize(name)
      raise ArgumentError, 'Participant must have a name' if name.nil?

      @name = name
    end
  end
end
