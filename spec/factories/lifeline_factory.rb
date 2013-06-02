#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

FactoryGirl.define do
  factory :lifeline_doc, class: Nokogiri::XML::Document do
    skip_create

    ignore do
      name 'Alice'
    end

    initialize_with do
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.svg(xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: '1000', height: '1000') do
          xml.g do
            xml.line(x1: 150, y1: 109, x2: 150, y2: 195, stroke: 'black', 'stroke-width' => 1)

            xml.g(stroke: 'black') do
              xml.rect(x: 139, y: 100, width: 22, height: 18, fill: 'white')
              xml.text_(name, x: 140, y: 115, 'font-family' => 'Abscissa', 'font-size' => 12)
            end

            xml.g(stroke: 'black', 'stroke-width' => 1) do
              xml.line(x1: 145, y1: 190, x2: 155, y2: 200)
              xml.line(x1: 155, y1: 190, x2: 145, y2: 200)
            end
          end
        end
      end

      builder.doc
    end
  end
end
