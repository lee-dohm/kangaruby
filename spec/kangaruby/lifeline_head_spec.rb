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
  let(:head) { LifelineHead.new(name) }
  let(:name) { 'Alice' }
  let(:rect) { Rect.new [100] * 4 }

  let(:drawn_node) { FactoryGirl.create(:lifeline_head_doc) }

  it 'has defaults' do
    expect(head.name).to eq('Alice')
    expect(head.font).to eq(font)
    expect(head.margin).to eq(default_margin)
    expect(head.padding).to eq(default_padding)
    expect(head.border).to eq(default_border_thickness)
    expect(head.font_size).to eq(default_point_size)
  end

  it 'can have its visual style customized' do
    head = LifelineHead.new(name, border: 50, font_size: 50, margin: 50, padding: 50)

    expect(head.border).to eq(50)
    expect(head.font_size).to eq(50)
    expect(head.margin).to eq(50)
    expect(head.padding).to eq(50)
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
