#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Diagram do
  let(:diagram) { Diagram.new }

  it 'has a collection of lifelines' do
    expect(diagram.lifelines).to eq([])
  end

  it 'has a collection of arrows' do
    expect(diagram.arrows).to eq([])
  end

  it 'can draw itself'
end
