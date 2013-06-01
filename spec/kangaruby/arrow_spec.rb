#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Arrow do
  let(:default_arrow_head_height) { 10 }
  let(:default_arrow_head_width) { 5 }
  let(:default_color) { 'black' }
  let(:default_thickness) { 1 }

  let(:arrow) { Arrow.new(1, 2) }
  let(:left_arrow) { Arrow.new(2, 1) }
  let(:right_arrow) { Arrow.new(1, 2) }
  let(:doc) { svg }
  let(:rect) { Rect.new [100] * 4 }

  let(:arrow_left) { FactoryGirl.build(:arrow_left) }
  let(:arrow_right) { FactoryGirl.build(:arrow_right) }

  it 'can be constructed with defaults' do
    expect(arrow.from).to eq(1)
    expect(arrow.to).to eq(2)
    expect(arrow.style).to eq(:solid)
    expect(arrow.head_height).to eq(default_arrow_head_height)
    expect(arrow.head_width).to eq(default_arrow_head_width)
    expect(arrow.thickness).to eq(default_thickness)
    expect(arrow.color).to eq(default_color)
  end

  it 'allows visual properties to be set at creation' do
    arrow = Arrow.new(1, 2, style: :dotted, height: 50, width: 50, color: '#000', thickness: 50)

    expect(arrow.style).to eq(:dotted)
    expect(arrow.head_width).to eq(50)
    expect(arrow.head_height).to eq(50)
    expect(arrow.color).to eq('#000')
    expect(arrow.thickness).to eq(50)
  end

  it 'raises an error if style is something other than solid or dotted' do
    expect { Arrow.new(1, 2, style: :foo) }.to raise_error(ArgumentError)
  end

  it 'raises an error if color is invalid' do
    expect { Arrow.new(1, 2, color: 'foo') }.to raise_error(ArgumentError)
  end

  it 'describes its minimum size' do
    expect(arrow.minimum_size).to be_an_instance_of(Size)
    expect(arrow.minimum_size).to eq([default_arrow_head_width * 2, default_arrow_head_height])
  end

  it 'draws itself to the left' do
    left_arrow.draw(doc.root, rect)

    expect(doc).to be_equivalent_to(arrow_left)
  end

  it 'draws itself to the right' do
    arrow.draw(doc.root, rect)

    expect(doc).to be_equivalent_to(arrow_right)
  end

  it 'draws itself pointing to the same lifeline that it starts from'
end
