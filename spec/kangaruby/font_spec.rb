#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Font do
  let(:font) { Font.new 'Abscissa' }
  let(:points) { 18 }
  let(:text) { 'The quick brown fox jumped over the lazy dog' }

  it 'can be constructed using a font name from the fonts in the gem' do
    expect(font).to_not be_nil
  end

  it 'can be constructed using a path to a font' do
    font = Font.new 'fonts/Abscissa.ttf'

    expect(font).to_not be_nil
  end

  it 'will have a name' do
    expect(font.name).to eq('Abscissa')
  end

  it 'can calculate the width of a given string of text in pixels' do
    expect(font.text_width(text, points)).to eq(336)
  end

  it 'can calculate the height of a line of text in pixels' do
    expect(font.text_height(points)).to eq(24)
  end

  it 'is equal to another font of the same name' do
    expect(font).to eq(Font.new('fonts/Abscissa.ttf'))
  end
end
