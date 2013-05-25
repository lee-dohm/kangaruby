#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

# Accepts a list of names and returns a list of `Participant`s.
#
# @param [Array] names Names for the participants.
# @return [Array] List of participants.
def participants(*names)
  names.map do |name|
    Participant.new(name)
  end
end
