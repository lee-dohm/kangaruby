#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe LifelineTail do
  let(:doc) { svg }
  let(:rect) { Rect.new [100] * 4 }
  let(:tail) { LifelineTail.new }
  let(:drawn_node) { FactoryGirl.create(:lifeline_tail_doc) }

  it 'can describe its minimum size' do
    expect(tail.minimum_size).to eq([10, 10])
  end

  it 'can draw itself' do
    tail.draw(doc.root, rect)

    expect(doc).to be_equivalent_to(drawn_node)
  end
end
