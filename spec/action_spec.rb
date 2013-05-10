#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Action do
  let(:action) { Action.new('Alice', 'Bob') }

  it 'takes names of a from and to participant' do
    expect(action.from).to eq('Alice')
    expect(action.to).to eq('Bob')
  end

  it 'raises an error if either the from or to participant is not specified' do
    expect { Action.new(nil, 'Bob') }.to raise_error(ArgumentError)
    expect { Action.new('Alice', nil) }.to raise_error(ArgumentError)
  end

  it 'defaults to the solid line style' do
    expect(action.style).to eq(:solid)
  end

  it 'accepts a style argument when constructed' do
    expect(Action.new('Alice', 'Bob', :dotted).style).to eq(:dotted)
  end

  it 'raises an error if it does not recognize the style' do
    expect { Action.new('Alice', 'Bob', :foo) }.to raise_error(ArgumentError)
  end

  it 'is equivalent to another Action with the same attributes' do
    expect(action).to eq(Action.new('Alice', 'Bob', :solid))
    expect(action).to_not eq(Action.new('Alice', 'Bob', :dotted))
    expect(action).to_not eq(Action.new('A', 'Bob', :solid))
    expect(action).to_not eq(Action.new('Alice', 'B', :solid))
  end

  it 'is not equivalent to another Action with different attributes'

  it 'is not equivalent to another object that does not respond to from, to or style'
end
