#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe LifelineTail do
  let(:doc) { svg }
  let(:rect) { Rect.new [100] * 4 }
  let(:tail) { LifelineTail.new }
  let(:drawn_node) do
    create_doc <<-EOS
      <svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>
        <g stroke='black' stroke-width='1'>
          <line x1='145' y1='145' x2='155' y2='155' />
          <line x1='155' y1='145' x2='145' y2='155' />
        </g>
      </svg>
    EOS
  end

  it 'can describe its minimum size' do
    expect(tail.minimum_size).to eq([10, 10])
  end

  it 'can draw itself' do
    tail.draw(doc.root, rect)

    expect(doc).to be_equivalent_to(drawn_node)
  end
end
