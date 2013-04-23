#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Rect do
  context '#initialize' do
    let(:rect) { Rect.new }

    it 'has an x, y, width and height attributes' do
      expect(rect.x).to eq(0)
      expect(rect.y).to eq(0)
      expect(rect.width).to eq(0)
      expect(rect.height).to eq(0)
    end

    it 'can be initialized from a list of values' do
      rect = Rect.new(1, 2, 3, 4)

      expect(rect.x).to eq(1)
      expect(rect.y).to eq(2)
      expect(rect.width).to eq(3)
      expect(rect.height).to eq(4)
    end

    it 'can be initialized from a four-element array' do
      rect = Rect.new [1, 2, 3, 4]

      expect(rect.x).to eq(1)
      expect(rect.y).to eq(2)
      expect(rect.width).to eq(3)
      expect(rect.height).to eq(4)
    end
  end

  context 'attributes' do
    let(:rect) { Rect.new 1, 2, 3, 4 }

    it 'has a right coordinate' do
      expect(rect.right).to eq(4)
    end

    it 'has a bottom coordinate' do
      expect(rect.bottom).to eq(6)
    end
  end
end
