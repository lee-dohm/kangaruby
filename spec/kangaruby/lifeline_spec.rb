#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Lifeline do
  let(:doc)      { svg }
  let(:font)     { Font.new('Abscissa') }
  let(:lifeline) { Lifeline.new(name) }
  let(:name)     { 'Alice' }
  let(:rect)     { Rect.new [100] * 4 }

  let(:drawn_node) do
    create_doc <<-EOS
      <svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>
        <g>
          <line x1='150' y1='109' x2='150' y2='195' stroke='black' stroke-width='1' />
          <g stroke='black'>
            <rect x='139' y='100' width='22' height='18' fill='white' />
            <text x='140' y='115' font-family='Abscissa' font-size='12'>#{name}</text>
          </g>
          <g stroke='black' stroke-width='1'>
            <line x1='145' y1='190' x2='155' y2='200' />
            <line x1='155' y1='190' x2='145' y2='200' />
          </g>
        </g>
      </svg>
    EOS
  end

  it 'has a name' do
    expect(lifeline.name).to eq('Alice')
  end

  it 'has a head' do
    expect(lifeline.head).to_not be_nil
    expect(lifeline.head.name).to eq('Alice')
    expect(lifeline.head.font).to eq(font)
  end

  it 'has a tail' do
    expect(lifeline.tail).to_not be_nil
  end

  it 'describes its minimum size' do
    head_width = lifeline.head.minimum_size[0]
    tail_width = lifeline.tail.minimum_size[0]
    expected_width = [head_width, tail_width].max

    head_height = lifeline.head.minimum_size[1]
    tail_height = lifeline.tail.minimum_size[1]
    expected_height = head_height + tail_height

    expect(lifeline.minimum_size).to eq([expected_width, expected_height])
  end

  it 'expects return value from #minimum_size to be a Size object' do
    expect(lifeline.minimum_size).to be_an_instance_of(Size)
  end

  it 'gives the height of its head' do
    expect(lifeline.head_height).to eq(lifeline.head.minimum_size.height)
  end

  it 'gives the height of its tail' do
    expect(lifeline.tail_height).to eq(lifeline.tail.minimum_size.height)
  end

  it 'draws itself' do
    lifeline.draw(doc.root, rect)

    expect(doc).to be_equivalent_to(drawn_node)
  end
end
