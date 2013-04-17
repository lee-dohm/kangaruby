#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'spec_helpers'

require 'kangaruby'

include KangaRuby

describe OrderedSet do
  it 'will be empty at first' do
    set = OrderedSet.new

    expect(set.count).to eq(0)
  end
end
