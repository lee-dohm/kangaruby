#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe LifelineTail do
  let(:doc) { svg }
  let(:rect) { Rect.new [100] * 4 }
  let(:tail) { LifelineTail.new }
  let(:drawn_node) do
    text = <<-EOS
<g stroke='black' stroke-width='1'>
  <line x1='145' y1='145' x2='155' y2='155' />
  <line x1='155' y1='145' x2='145' y2='155' />
</g>
EOS

    Nokogiri::XML.fragment(text) % 'g'
  end

  it 'can describe its minimum size' do
    expect(tail.minimum_size).to eq([10, 10])
  end

  it 'can draw itself' do
    node = tail.draw(rect, doc)

    expect(node).to be_equivalent_to(drawn_node)
  end
end
