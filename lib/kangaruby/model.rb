#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Represents the set of participants and activities as a matrix of columns and rows.
  class Model
    # Set of participants in the model.
    attr_reader :columns

    # Set of activities in the model.
    attr_reader :rows

    # Initializes an empty model.
    def initialize
      @columns = []
      @rows = []
    end
  end
end
