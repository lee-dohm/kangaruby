#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Arrow do
  let(:arrow) { Arrow.new }

  it 'has a line style' do
    expect(arrow.style).to eq(:solid)
  end

  it 'can describe its minimum size' do
    expect(arrow.minimum_size).to eq([10, 10])
  end

  it 'can draw itself'
end
