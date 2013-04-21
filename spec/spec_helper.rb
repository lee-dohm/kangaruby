#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'simplecov'
SimpleCov.start do
  add_filter 'grammar/'
end

require 'rspec'

require 'kangaruby'

include KangaRuby

# Accepts a list of names and returns a list of `Participant`s.
#
# @param [Array] names Names for the participants.
# @return [Array] List of participants.
def participants(*names)
  names.map do |name|
    Participant.new(name)
  end
end

# Accepts a list of arrays of parameters and returns a list of `Action`s.
#
# @param [Array] params List of arrays of parameters to pass to the `Action` constructor.
# @return [Array] List of actions.
def actions(*params)
  params.map do |param|
    Action.new(*param)
  end
end
