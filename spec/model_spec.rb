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
    model.participants << Participant.new('A')

    expect(model.participants.count).to eq(1)
    expect(model.participants[0].name).to eq('A')
  end

  # it 'will not accept two participants with the same name' do
  #   model.participants << Participant.new('A')

  #   expect { model.participants << Participant.new('A') }.to raise_error(DuplicateParticipantError)
  # end
end
