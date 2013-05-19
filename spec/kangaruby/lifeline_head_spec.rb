#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe LifelineHead do
  let(:default_border_thickness) { 1 }
  let(:default_margin) { 0 }
  let(:default_padding) { 0 }
  let(:default_point_size) { 12 }
  let(:doc) { svg }
  let(:font) { Font.new('Abscissa') }
  let(:head) { LifelineHead.new(name, font) }
  let(:name) { 'Alice' }
  let(:rect) { Rect.new [100] * 4 }

  let(:drawn_node) do
    create_doc <<-EOS
      <svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>
        <g stroke='black'>
          <rect x='#{rect.x}' y='#{rect.y}' width='#{rect.width}' height='#{rect.height}' fill='white' />
          <text x='140' y='156' font-family='Abscissa' font-size='12'>#{name}</text>
        </g>
      </svg>
    EOS
  end

  it 'has a name' do
    expect(head.name).to eq('Alice')
  end

  it 'has a font' do
    expect(head.font).to be(font)
  end

  it 'has a margin value' do
    expect(head.margin).to eq(default_margin)
  end

  it 'has a padding value' do
    expect(head.padding).to eq(default_padding)
  end

  it 'has a border thickness' do
    expect(head.border).to eq(default_border_thickness)
  end

  it 'has a font size' do
    expect(head.font_size).to eq(default_point_size)
  end

  it 'can describe its minimum size' do
    text_width = font.text_width(name, default_point_size)
    text_height = font.text_height(default_point_size)

    expected_width = text_width + 2 * default_margin + 2 * default_padding + 2 * default_border_thickness
    expected_height = text_height + 2 * default_margin + 2 * default_padding + 2 * default_border_thickness

    expect(head.minimum_size).to eq([expected_width, expected_height])
  end

  it 'returns a Size object from #minimum_size' do
    expect(head.minimum_size).to be_an_instance_of(Size)
  end

  it 'can draw itself' do
    head.draw(doc.root, rect)

    expect(doc).to be_equivalent_to(drawn_node)
  end
end
