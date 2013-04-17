#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the error that occurs when adding two participants with the same name.
  class DuplicateParticipantError < StandardError
  end

  # Represents the set of participants and activities.
  class Model
    # Set of activities in the model.
    attr_reader :activities

    # Set of participants in the model.
    attr_reader :participants

    # Initializes an empty model.
    def initialize
      @activities = OrderedSet.new
      @participants = OrderedSet.new
    end
  end
end
