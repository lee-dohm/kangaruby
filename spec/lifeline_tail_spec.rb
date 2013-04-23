#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe LifelineTail do
  let(:doc) { svg }
  let(:rect) { Rect.new [100] * 4 }
  let(:tail) { LifelineTail.new }

  it 'can describe its minimum size' do
    expect(tail.minimum_size).to eq([10, 10])
  end

  it 'can draw itself' do
    node = tail.draw(rect, doc)

    expect(node.name).to eq('g')
    expect(node.attributes['stroke'].value).to eq('black')
    expect(node.attributes['stroke-width'].value).to eq('1')
    expect(node.children).to include_element('line', x1: 145, y1: 145, x2: 155, y2: 155)
    expect(node.children).to include_element('line', x1: 155, y1: 145, x2: 145, y2: 155)
  end
end
