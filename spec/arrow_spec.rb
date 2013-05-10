#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Arrow do
  let(:arrow) { Arrow.new }
  let(:doc) { Nokogiri::XML::Document.new }
  let(:rect) { Rect.new [100] * 4 }

  let(:drawn_node) do
    create_node <<-EOS
<g stroke='black' stroke-width='1'>
  <line x1='195' y1='145' x2='200' y2='150' />
  <line x1='195' y1='155' x2='200' y2='150' />
  <line x1='100' y1='150' x2='200' y2='150' />
</g>
    EOS
  end

  it 'has a line style' do
    expect(arrow.style).to eq(:solid)
  end

  it 'can have a line style assigned on creation' do
    arrow = Arrow.new :dotted

    expect(arrow.style).to eq(:dotted)
  end

  it 'can describe its minimum size' do
    expect(arrow.minimum_size).to be_an_instance_of(Size)
    expect(arrow.minimum_size).to eq([10, 10])
  end

  it 'can draw itself' do
    node = arrow.draw(rect, doc)

    expect(node).to be_equivalent_to(drawn_node)
  end
end
