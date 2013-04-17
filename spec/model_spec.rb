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

  it 'will accept new participants' do
    model.participants << Participant.new('Alice')

    expect(model.participants.count).to eq(1)
    expect(model.participants[0].name).to eq('Alice')
  end

  it 'will not add a second participant with the same name' do
    model.participants << Participant.new('Alice')
    model.participants << Participant.new('Alice')

    expect(model.participants.count).to eq(1)
    expect(model.participants[0].name).to eq('Alice')
  end
end
