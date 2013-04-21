#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Diagram do
  let(:diagram) { Diagram.new }

  it 'has a collection of lifelines' do
    expect(diagram.lifelines).to eq([])
  end

  it 'has a collection of actions' do
    expect(diagram.actions).to eq([])
  end
end
