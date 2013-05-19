#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Diagram do
  let(:diagram) { Diagram.new }
  let(:font) { Font.new('Abscissa') }

  let(:drawn_diagram) do
    create_doc <<-EOS
      <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="40" height="38">
       <g>
         <line x1="11" y1="9" x2="11" y2="33" stroke="black" stroke-width="1"/>
         <g stroke="black">
           <rect x="0" y="0" width="22" height="18" fill="white"/>
           <text x="1" y="15" font-family="Abscissa" font-size="12">Alice</text>
         </g>
         <g stroke="black" stroke-width="1">
           <line x1="6" y1="28" x2="16" y2="38"/>
           <line x1="16" y1="28" x2="6" y2="38"/>
         </g>
       </g>
       <g>
         <line x1="31" y1="9" x2="31" y2="33" stroke="black" stroke-width="1"/>
         <g stroke="black">
           <rect x="22" y="0" width="18" height="18" fill="white"/>
           <text x="23" y="15" font-family="Abscissa" font-size="12">Bob</text>
         </g>
         <g stroke="black" stroke-width="1">
           <line x1="26" y1="28" x2="36" y2="38"/>
           <line x1="36" y1="28" x2="26" y2="38"/>
         </g>
       </g>
       <g stroke="black" stroke-width="1">
         <line x1="26" y1="18" x2="31" y2="23"/>
         <line x1="26" y1="28" x2="31" y2="23"/>
         <line x1="11" y1="23" x2="31" y2="23"/>
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

  it 'can draw itself' do
    diagram.lifelines << Lifeline.new('Alice', font)
    diagram.lifelines << Lifeline.new('Bob', font)
    diagram.arrows << Arrow.new(0, 1)

    expect(diagram.draw).to be_equivalent_to(drawn_diagram)
  end
end
