#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe LifelineTail do
  let(:tail) { LifelineTail.new }

  it 'can describe its minimum size' do
    expect(tail.minimum_size).to eq([10, 10])
  end

  it 'can draw itself'
end
