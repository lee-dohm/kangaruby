#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the set of participants and actions.
  class Model
    # Set of actions in the model.
    attr_reader :actions

    # Set of participants in the model.
    attr_reader :participants

    # Initializes an empty model.
    def initialize
      @actions = []
      @participants = OrderedSet.new
    end
  end
end
