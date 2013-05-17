#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Diagram do
  let(:diagram) { Diagram.new }
  let(:font) { Font.new('fonts/Abscissa.ttf') }

  let(:drawn_diagram) do
    create_node <<-EOS
    <svg>
      <g>
      </g>

      <g>
      </g>

      <g>
      </g>
    </svg>
    EOS
  end

  it 'has a collection of lifelines' do
    expect(diagram.lifelines).to eq([])
  end

  it 'has a collection of arrows' do
    expect(diagram.arrows).to eq([])
  end

  it 'can draw itself'

  # it 'can draw itself' do
  #   diagram.lifelines << Lifeline.new('Alice', font)
  #   diagram.lifelines << Lifeline.new('Bob', font)
  #   diagram.arrows << Arrow.new(0, 1)

  #   expect(diagram.draw).to be_equivalent_to(drawn_diagram)
  # end
end
