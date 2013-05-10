#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module KangaRuby
  # Acceptable list of line styles.
  STYLES = [:solid, :dotted]

  # Represents one action in the sequence of actions.
  class Action
    # Name of the participant the action is coming from.
    attr_reader :from

    # Style of the line representing the action.
    attr_reader :style

    # Name of the participant the action is going to.
    attr_reader :to

    # Initializes the action with the given attributes.
    #
    # @param from Name of the participant the action is coming from.
    # @param to Name of the participant the action is going to.
    # @param style Line style for the action.
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

    # Determines if `other` is equivalent to this object.
    #
    # @param [#from,#style,#to] other Object to compare.
    # @return [Boolean] `true` if `other` is equivalent; `false` otherwise.
    def ==(other)
      return false unless other.respond_to?(:from) && other.respond_to?(:to) && other.respond_to?(:style)

      @from == other.from && @to == other.to && @style == other.style
    end
  end
end
