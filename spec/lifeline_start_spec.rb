#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe LifelineStart do
  let(:font) { Font.new('./fonts/Abscissa.ttf') }
  let(:start) { LifelineStart.new('Alice', font) }

  it 'accepts a name' do
    expect(start.name).to eq('Alice')
  end
end
