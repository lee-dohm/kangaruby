#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe OrderedSet do
  let(:set) { OrderedSet.new(1, 2, 3) }

  it 'is Enumerable' do
    expect(set).to be_a_kind_of(Enumerable)
  end

  it 'starts empty' do
    set = OrderedSet.new

    expect(set.count).to eq(0)
    expect(set[0]).to be_nil
  end

  it 'adds objects during construction' do
    expect(set).to eq([1, 2, 3])
  end

  it 'only adds unique objects during construction' do
    set = OrderedSet.new(1, 2, 1)

    expect(set).to eq([1, 2])
  end

  it 'accepts new objects' do
    set = OrderedSet.new

    new_set = set << 1

    expect(set).to eq([1])
    expect(new_set).to be(set)
    expect(new_set).to be_an_instance_of(OrderedSet)
  end

  it 'rejects objects already in the set quietly' do
    set = OrderedSet.new(1)

    new_set = set << 1

    expect(set).to eq([1])
    expect(new_set).to be(set)
    expect(new_set).to be_an_instance_of(OrderedSet)
  end

  it 'is equivalent to another enumerable with the same items' do
    other = [1, 2, 3]

    expect(set).to eq(other)
  end

  it 'is not equivalent to another enumerable with different items' do
    other = [1, 2, 1]

    expect(set).to_not eq(other)
  end

  it 'is not equivalent to another enumerable with the same, but more items' do
    other = [1, 2, 3, 4]

    expect(set).to_not eq(other)
  end

  it 'is not equivalent to something that is not an Enumerable' do
    other = 'foo'

    expect(set).to_not eq(other)
  end

  it 'looks like an array when inspected' do
    expect(set.inspect).to eq('[1, 2, 3]')
  end

  it 'looks like an array when converted to String' do
    expect(set.to_s).to eq('[1, 2, 3]')
  end

  it 'can be enumerated' do
    list = []

    set.each do |item|
      list << item
    end

    expect(list).to eq([1, 2, 3])
  end
end
