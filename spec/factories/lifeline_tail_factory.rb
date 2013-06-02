#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

FactoryGirl.define do
  factory :lifeline_tail_doc, class: Nokogiri::XML::Document do
    skip_create

    initialize_with do
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.svg(xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: '1000', height: '1000') do
          xml.g(stroke: 'black', 'stroke-width' => 1) do
            xml.line(x1: 145, y1: 145, x2: 155, y2: 155)
            xml.line(x1: 155, y1: 145, x2: 145, y2: 155)
          end
        end
      end

      builder.doc
    end
  end
end
