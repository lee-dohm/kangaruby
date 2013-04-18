#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Participant do
  let(:participant) { Participant.new 'Alice' }

  it 'has a name' do
    expect(participant.name).to eq('Alice')
  end

  it 'raises an error on a nil name' do
    expect { Participant.new(nil) }.to raise_error(ArgumentError)
  end

  it 'is equivalent to another participant with the same name' do
    expect(participant).to eq(Participant.new('Alice'))
  end
end
