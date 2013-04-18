#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Acceptable list of line styles.
  STYLES = [:solid, :dotted]

  # Represents one activity in the sequence of activities.
  class Activity
    # Name of the participant the activity is coming from.
    attr_reader :from

    # Style of the line representing the activity.
    attr_reader :style

    # Name of the participant the activity is going to.
    attr_reader :to

    # Initializes the activity with the given attributes.
    #
    # @param from Name of the participant the activity is coming from.
    # @param to Name of the participant the activity is going to.
    # @param style Line style for the activity.
    # @raise [ArgumentError] When `from` or `to` are `nil`.
    # @raise [ArgumentError] When `style` is not a recognized line style.
    def initialize(from, to, style = :solid)
      raise ArgumentError, 'Requires a from participant' if from.nil?
      raise ArgumentError, 'Requires a to participant' if to.nil?
      raise ArgumentError, "#{style} is not a recognized line style" unless STYLES.include? style

      @from = from
      @to = to
      @style = style
    end
  end
end
