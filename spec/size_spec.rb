#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Size do
  let(:size) { Size.new 10, 20 }

  it 'has a width and height that defaults to zero' do
    size = Size.new

    expect(size.width).to eq(0)
    expect(size.height).to eq(0)
  end

  it 'can set the width and height at initialization' do
    expect(size.width).to eq(10)
    expect(size.height).to eq(20)
  end

  it 'can accept an array for initialization' do
    expect(size.width).to eq(10)
    expect(size.height).to eq(20)
  end

  it 'returns width and height via the index operator' do
    expect(size[0]).to eq(10)
    expect(size[1]).to eq(20)
    expect(size[2]).to be_nil
  end

  it 'can compare as equivalent to an array' do
    expect(size).to eq([10, 20])
    expect(size).to_not eq([0, 0])
    expect(size).to_not eq([10, 20, 30])
  end

  it 'can compare as equivalent to another Size' do
    expect(size).to eq(Size.new 10, 20)
    expect(size).to_not eq(Size.new)
  end

  it 'is not equivalent to other objects' do
    expect(size).to_not eq('foo')
  end
end
