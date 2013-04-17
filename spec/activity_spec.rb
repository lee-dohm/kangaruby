#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'spec_helpers'

require 'kangaruby'

include KangaRuby

describe Activity do
  let(:activity) { Activity.new('A', 'B') }

  it 'takes names of a from and to participant' do
    expect(activity.from).to eq('A')
    expect(activity.to).to eq('B')
  end

  it 'raises an error if either the from or to participant is not specified' do
    expect { Activity.new(nil, 'B') }.to raise_error(ArgumentError)
    expect { Activity.new('A', nil) }.to raise_error(ArgumentError)
  end

  it 'defaults to the solid line style' do
    expect(activity.style).to eq(:solid)
  end

  it 'accepts a style argument when constructed' do
    expect(Activity.new('A', 'B', :dotted).style).to eq(:dotted)
  end

  it 'raises an error if it does not recognize the style' do
    expect { Activity.new('A', 'B', :foo) }.to raise_error(ArgumentError)
  end
end
