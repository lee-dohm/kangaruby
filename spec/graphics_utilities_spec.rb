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

    it 'raises an ArgumentError when rect is nil' do
      expect { test.center(nil, 10, 20) }.to raise_error(ArgumentError)
      expect { test.center(rect, nil, 20) }.to raise_error(ArgumentError)
      expect { test.center(rect, 10, nil) }.to raise_error(ArgumentError)
    end
  end
end
