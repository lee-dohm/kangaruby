#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Font do
  let(:font) { Font.new './fonts/Abscissa.ttf' }
  let(:points) { 18 }
  let(:text) { 'The quick brown fox jumped over the lazy dog' }

  it 'will have a name' do
    expect(font.name).to eq('Abscissa')
  end

  it 'can calculate the width and height of a given string of text in pixels' do
    expect(font.text_width(text, points)).to eq(336)
    expect(font.text_height(points)).to eq(24)
  end
end
