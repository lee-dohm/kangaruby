#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Arrow do
  let(:arrow) { Arrow.new(1, 2) }
  let(:left_arrow) { Arrow.new(2, 1) }
  let(:right_arrow) { Arrow.new(1, 2) }
  let(:doc) { svg }
  let(:rect) { Rect.new [100] * 4 }

  let(:drawn_node_left) do
    create_doc <<-EOS
      <svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>
        <g stroke='black' stroke-width='1'>
          <line x1='105' y1='145' x2='100' y2='150' />
          <line x1='105' y1='155' x2='100' y2='150' />
          <line x1='200' y1='150' x2='100' y2='150' />
        </g>
      </svg>
    EOS
  end

  let(:drawn_node_right) do
    create_doc <<-EOS
      <svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>
        <g stroke='black' stroke-width='1'>
          <line x1='195' y1='145' x2='200' y2='150' />
          <line x1='195' y1='155' x2='200' y2='150' />
          <line x1='100' y1='150' x2='200' y2='150' />
        </g>
      </svg>
    EOS
  end

  it 'has a line style' do
    expect(arrow.style).to eq(:solid)
  end

  it 'has a from index' do
    expect(arrow.from).to eq(1)
  end

  it 'has a to index' do
    expect(arrow.to).to eq(2)
  end

  it 'raises an error if style is something other than solid or dotted' do
    expect { Arrow.new 1, 2, :foo }.to raise_error(ArgumentError)
  end

  it 'can have a line style assigned on creation' do
    arrow = Arrow.new 1, 2, :dotted

    expect(arrow.style).to eq(:dotted)
  end

  it 'describes its minimum size' do
    expect(arrow.minimum_size).to be_an_instance_of(Size)
    expect(arrow.minimum_size).to eq([10, 10])
  end

  it 'draws itself to the left' do
    left_arrow.draw(doc.root, rect)

    expect(doc).to be_equivalent_to(drawn_node_left)
  end

  it 'draws itself to the right' do
    arrow.draw(doc.root, rect)

    expect(doc).to be_equivalent_to(drawn_node_right)
  end

  it 'draws itself pointing to the same lifeline that it starts from'
end
