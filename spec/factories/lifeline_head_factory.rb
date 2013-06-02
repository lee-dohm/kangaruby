#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

FactoryGirl.define do
  factory :lifeline_head_doc, class: Nokogiri::XML::Document do
    skip_create

    ignore do
      border 1
      color 'black'
      x 100
      y 100
      width 100
      height 100
      name 'Alice'
    end

    initialize_with do
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.svg(xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: '1000', height: '1000') do
          xml.g(stroke: color, 'stroke-width' => border) do
            xml.rect(x: x, y: y, width: width, height: height, fill: 'white')
            xml.text_(name, x: 140, y: 156, 'font-family' => 'Abscissa', 'font-size' => 12)
          end
        end
      end

      builder.doc
    end
  end
end
