#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Font do
  let(:font) { Font.new './fonts/Abscissa.ttf' }
  let(:text) { 'The quick brown fox jumped over the lazy dog' }

  it 'will have a name' do
    expect(font.name).to eq('Abscissa')
  end

  it 'will have a scale factor' do
    expect(font.scale_factor).to eq(1.0)
  end

  it 'can calculate the width and height of a given string of text' do
    expect(font.text_width(text)).to eq(18679.0)
    expect(font.text_height).to eq(1352.0)
  end
end
