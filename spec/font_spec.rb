#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Font do
  let(:font) { Font.new './fonts/Abscissa.ttf' }

  it 'will have a name' do
    expect(font.name).to eq('Abscissa')
  end

  it 'will have a scale factor'

  it 'can calculate the width and height of a given string of text'
end
