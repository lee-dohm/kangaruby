#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'spec_helpers'

require 'kangaruby'

include KangaRuby

describe Model do
  let(:model) { Model.new }

  it 'will have no participants or activities by default' do
    expect(model.participants.count).to eq(0)
    expect(model.activities.count).to eq(0)
  end
end
