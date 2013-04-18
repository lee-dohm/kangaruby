#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe OrderedSet do
  it 'starts empty' do
    set = OrderedSet.new

    expect(set.count).to eq(0)
  end

  it 'adds objects during construction' do
    set = OrderedSet.new(1, 2, 3)

    expect(set.count).to eq(3)
    expect(set[0]).to eq(1)
    expect(set[1]).to eq(2)
    expect(set[2]).to eq(3)
  end

  it 'only adds unique objects during construction' do
    set = OrderedSet.new(1, 2, 1)

    expect(set.count).to eq(2)
    expect(set[0]).to eq(1)
    expect(set[1]).to eq(2)
  end

  it 'accepts new objects' do
    set = OrderedSet.new

    new_set = set << 1

    expect(set.count).to eq(1)
    expect(set[0]).to eq(1)
    expect(new_set).to be(set)
    expect(new_set).to be_an_instance_of(OrderedSet)
  end

  it 'rejects objects already in the set quietly' do
    set = OrderedSet.new(1)

    new_set = set << 1

    expect(set.count).to eq(1)
    expect(set[0]).to eq(1)
    expect(new_set).to be(set)
    expect(new_set).to be_an_instance_of(OrderedSet)
  end

  it 'is equivalent to another enumerable with the same items' do
    set = OrderedSet.new(1, 2, 3)
    other = [1, 2, 3]

    expect(set).to eq(other)
  end

  it 'is not equivalent to another enumerable with different items' do
    set = OrderedSet.new(1, 2, 3)
    other = [1, 2, 1]

    expect(set).to_not eq(other)
  end

  it 'looks like an array when inspected' do
    set = OrderedSet.new(1, 2, 3)

    expect(set.inspect).to eq('[1, 2, 3]')
  end
end
