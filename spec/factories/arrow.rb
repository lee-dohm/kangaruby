#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

FactoryGirl.define do
  factory :arrow_left, class: Nokogiri::XML::Document do
    skip_create

    ignore do
      stroke 'black'
      width 1
    end

    initialize_with do
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.svg(xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: '1000', height: '1000') do
          xml.g(stroke: stroke, 'stroke-width' => width) do
            xml.line(x1: '105', y1: '145', x2: '100', y2: '150')
            xml.line(x1: '105', y1: '155', x2: '100', y2: '150')
            xml.line(x1: '200', y1: '150', x2: '100', y2: '150')
          end
        end
      end

      builder.doc
    end
  end

  factory :arrow_right, class: Nokogiri::XML::Document do
    skip_create

    ignore do
      stroke 'black'
      width 1
    end

    initialize_with do
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.svg(xmlns: 'http://www.w3.org/2000/svg', version: '1.1', width: '1000', height: '1000') do
          xml.g(stroke: stroke, 'stroke-width' => width) do
            xml.line(x1: '195', y1: '145', x2: '200', y2: '150')
            xml.line(x1: '195', y1: '155', x2: '200', y2: '150')
            xml.line(x1: '100', y1: '150', x2: '200', y2: '150')
          end
        end
      end

      builder.doc
    end
  end
end
