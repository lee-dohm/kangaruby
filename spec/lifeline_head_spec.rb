#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe LifelineHead do
  let(:name) { 'Alice' }
  let(:default_point_size) { 12 }
  let(:default_margin) { 0 }
  let(:default_padding) { 0 }
  let(:default_border_thickness) { 1 }

  let(:font) { Font.new('./fonts/Abscissa.ttf') }
  let(:head) { LifelineHead.new(name, font) }

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

  it 'can draw itself'
end
