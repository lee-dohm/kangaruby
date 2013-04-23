#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Lifeline do
  let(:font) { Font.new('fonts/Abscissa.ttf') }
  let(:lifeline) { Lifeline.new('Alice', font) }

  it 'has a name' do
    expect(lifeline.name).to eq('Alice')
  end

  it 'has a head' do
    expect(lifeline.head).to_not be_nil
    expect(lifeline.head.name).to eq('Alice')
    expect(lifeline.head.font).to be(font)
  end

  it 'has a tail' do
    expect(lifeline.tail).to_not be_nil
  end

  it 'can describe its minimum size' do
    head_width = lifeline.head.minimum_size[0]
    tail_width = lifeline.tail.minimum_size[0]
    expected_width = [head_width, tail_width].max

    head_height = lifeline.head.minimum_size[1]
    tail_height = lifeline.tail.minimum_size[1]
    expected_height = head_height + tail_height

    expect(lifeline.minimum_size).to eq([expected_width, expected_height])
  end

  it 'can draw itself'
end
