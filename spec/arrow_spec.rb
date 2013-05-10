#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Arrow do
  let(:arrow) { Arrow.new(:right) }
  let(:left_arrow) { Arrow.new(:left) }
  let(:right_arrow) { Arrow.new(:right) }
  let(:doc) { Nokogiri::XML::Document.new }
  let(:rect) { Rect.new [100] * 4 }

  let(:drawn_node_left) do
    create_node <<-EOS
<g stroke='black' stroke-width='1'>
  <line x1='105' y1='145' x2='100' y2='150' />
  <line x1='105' y1='155' x2='100' y2='150' />
  <line x1='200' y1='150' x2='100' y2='150' />
</g>
    EOS
  end

  let(:drawn_node_right) do
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

  it 'has a direction' do
    expect(arrow.direction).to eq(:right)
  end

  it 'raises an error if direction is something other than left or right' do
    expect { Arrow.new :foo }.to raise_error(ArgumentError)
  end

  it 'raises an error if style is something other than solid or dotted' do
    expect { Arrow.new :left, :foo }.to raise_error(ArgumentError)
  end

  it 'can have a line style assigned on creation' do
    arrow = Arrow.new :right, :dotted

    expect(arrow.style).to eq(:dotted)
  end

  it 'can describe its minimum size' do
    expect(arrow.minimum_size).to be_an_instance_of(Size)
    expect(arrow.minimum_size).to eq([10, 10])
  end

  it 'can draw itself to the left' do
    node = left_arrow.draw(rect, doc)

    expect(node).to be_equivalent_to(drawn_node_left)
  end

  it 'can draw itself to the right' do
    node = arrow.draw(rect, doc)

    expect(node).to be_equivalent_to(drawn_node_right)
  end
end
