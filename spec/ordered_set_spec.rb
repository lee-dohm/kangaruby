#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'spec_helpers'

require 'kangaruby'

include KangaRuby

describe OrderedSet do
  it 'will be empty at first' do
    set = OrderedSet.new

    expect(set.count).to eq(0)
  end

  it 'will add objects during construction' do
    set = OrderedSet.new(1, 2, 3)

    expect(set.count).to eq(3)
    expect(set[0]).to eq(1)
    expect(set[1]).to eq(2)
    expect(set[2]).to eq(3)
  end

  it 'will only add unique objects during construction' do
    set = OrderedSet.new(1, 2, 1)

    expect(set.count).to eq(2)
    expect(set[0]).to eq(1)
    expect(set[1]).to eq(2)
  end

  it 'will accept new objects' do
    set = OrderedSet.new

    new_set = set << 1

    expect(set.count).to eq(1)
    expect(set[0]).to eq(1)
    expect(new_set).to be(set)
    expect(new_set).to be_an_instance_of(OrderedSet)
  end

  it 'will quietly reject objects already in the set' do
    set = OrderedSet.new(1)

    new_set = set << 1

    expect(set.count).to eq(1)
    expect(set[0]).to eq(1)
    expect(new_set).to be(set)
    expect(new_set).to be_an_instance_of(OrderedSet)
  end
end
