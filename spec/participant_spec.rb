#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'spec_helpers'

require 'kangaruby'

include KangaRuby

describe Participant do
  let(:participant) { Participant.new 'A' }

  it 'will have a name' do
    expect(participant.name).to eq('A')
  end

  it 'will raise an error on a nil name' do
    expect { Participant.new(nil) }.to raise_error(ArgumentError)
  end

  it 'will be equal to another participant with the same name' do
    expect(participant).to eq(Participant.new('A'))
  end
end
