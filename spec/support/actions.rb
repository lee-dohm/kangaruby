#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

# Accepts a list of arrays of parameters and returns a list of `Action`s.
#
# @param [Array] params List of arrays of parameters to pass to the `Action` constructor.
# @return [Array] List of actions.
def actions(*params)
  params.map do |param|
    Action.new(*param)
  end
end
