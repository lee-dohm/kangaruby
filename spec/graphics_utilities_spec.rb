#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

class GraphicsUtilitiesTest
  include GraphicsUtilities
end

describe GraphicsUtilities do
  context '#center' do
    let(:rect) { Rect.new [100] * 4 }
    let(:test) { GraphicsUtilitiesTest.new }

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
end
