#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Activity do
  let(:activity) { Activity.new('Alice', 'Bob') }

  it 'takes names of a from and to participant' do
    expect(activity.from).to eq('Alice')
    expect(activity.to).to eq('Bob')
  end

  it 'raises an error if either the from or to participant is not specified' do
    expect { Activity.new(nil, 'Bob') }.to raise_error(ArgumentError)
    expect { Activity.new('Alice', nil) }.to raise_error(ArgumentError)
  end

  it 'defaults to the solid line style' do
    expect(activity.style).to eq(:solid)
  end

  it 'accepts a style argument when constructed' do
    expect(Activity.new('Alice', 'Bob', :dotted).style).to eq(:dotted)
  end

  it 'raises an error if it does not recognize the style' do
    expect { Activity.new('Alice', 'Bob', :foo) }.to raise_error(ArgumentError)
  end

  it 'is equivalent to another activity with the same attributes' do
    expect(activity).to eq(Activity.new('Alice', 'Bob', :solid))
    expect(activity).to_not eq(Activity.new('Alice', 'Bob', :dotted))
    expect(activity).to_not eq(Activity.new('A', 'Bob', :solid))
    expect(activity).to eq(Activity.new('Alice', 'B', :solid))
  end
end
