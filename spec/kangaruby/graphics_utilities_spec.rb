#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

class GraphicsUtilitiesTest
  include GraphicsUtilities
end

describe GraphicsUtilities do
  let(:rect) { Rect.new [100] * 4 }
  let(:test) { GraphicsUtilitiesTest.new }

  context '#center' do
    it 'raises an ArgumentError when rect, width or height is nil' do
      expect { test.center(nil, 10, 20) }.to raise_error(ArgumentError)
      expect { test.center(rect, nil, 20) }.to raise_error(ArgumentError)
      expect { test.center(rect, 10, nil) }.to raise_error(ArgumentError)
    end

    it 'returns a new rect' do
      new_rect = test.center(rect, 10, 20)

      expect(new_rect).to be_an_instance_of(Rect)
      expect(new_rect).to_not be(rect)
    end

    it 'creates a rect of the given width and height centered in the given rect' do
      new_rect = test.center(rect, 10, 20)

      expect(new_rect.width).to eq(10)
      expect(new_rect.height).to eq(20)
      expect(new_rect.x).to eq(145)
      expect(new_rect.y).to eq(140)
    end

    it 'creates a rect centered on the given rect if width or height is bigger' do
      new_rect = test.center(rect, 150, 200)

      expect(new_rect.width).to eq(150)
      expect(new_rect.height).to eq(200)
      expect(new_rect.x).to eq(75)
      expect(new_rect.y).to eq(50)
    end
  end

  context '#center_text' do
    it 'raises an ArgumentError when rect, text_width or font_size is nil' do
      expect { test.center_text(nil, 50, 12) }.to raise_error(ArgumentError)
      expect { test.center_text(rect, nil, 12) }.to raise_error(ArgumentError)
      expect { test.center_text(rect, 50, nil) }.to raise_error(ArgumentError)
    end

    it 'returns a two-element array' do
      pos = test.center_text(rect, 50, 12)

      expect(pos).to be_an_instance_of(Array)
      expect(pos.count).to eq(2)
    end

    it 'gives an x that centers the text_width within the rectangle' do
      pos = test.center_text(rect, 50, 12)

      expect(pos[0]).to eq(125)
    end

    it 'gives a y that is the centerpoint plus half the font_size' do
      pos = test.center_text(rect, 50, 12)

      expect(pos[1]).to eq(156)
    end
  end

  context '#valid_color?' do
    it 'returns true with a valid color name' do
      expect(test.valid_color?('black')).to be_true
    end

    it 'returns false with an invalid color name' do
      expect(test.valid_color?('foo')).to be_false
    end

    it 'returns true with a valid three-digit color code' do
      expect(test.valid_color?('#000')).to be_true
    end

    it 'returns false with an invalid three-digit color code' do
      expect(test.valid_color?('#GGG')).to be_false
    end

    it 'returns false with a four-digit color code' do
      expect(test.valid_color?('#0000')).to be_false
    end

    it 'returns true with a valid six-digit color code' do
      expect(test.valid_color?('#000000')).to be_true
    end

    it 'returns false with a seven-digit color code' do
      expect(test.valid_color?('#0000000')).to be_false
    end

    it 'returns false with an invalid six-digit color code' do
      expect(test.valid_color?('#GGGGGG')).to be_false
    end

    it 'returns true with a valid integer RGB value'

    it 'returns false with an invalid integer RGB value'

    it 'returns true with a valid float RGB value'

    it 'returns false with an invalid float RGB value'
  end
end
