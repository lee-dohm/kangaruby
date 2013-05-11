#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

class XmlUtilitiesTest
  include XmlUtilities
end

describe XmlUtilities do
  context '#add_child' do
    let(:document) { Nokogiri::XML::Document.new }
    let(:node) { document.create_element('foo') }
    let(:test) { XmlUtilitiesTest.new }

    it 'adds a child to a node' do
      test.add_child(node, 'bar')

      expect(node).to be_equivalent_to(create_node('<foo><bar /></foo>'))
    end

    it 'adds a child with attributes to a node' do
      test.add_child(node, 'bar', baz: 1, quux: 'wibble')

      expect(node).to be_equivalent_to(create_node('<foo><bar baz="1" quux="wibble" /></foo>'))
    end

    it 'returns the added child for chaining' do
      test.add_child(node, 'bar').content = 'baz'

      expect(node).to be_equivalent_to(create_node('<foo><bar>baz</bar></foo>'))
    end
  end
end
