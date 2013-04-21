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

# Accepts a list of arrays of parameters and returns a list of `Activity`s.
#
# @param [Array] params List of arrays of parameters to pass to the `Activity` constructor.
# @return [Array] List of activities.
def activities(*params)
  params.map do |param|
    Activity.new(*param)
  end
end
