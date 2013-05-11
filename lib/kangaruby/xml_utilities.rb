#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

module KangaRuby
  # Container for common XML functionality.
  module XmlUtilities
    # Adds a child node described by `args` to `element`.
    #
    # @param [Nokogiri::XML::Element] element Element to which to add the child.
    # @param [Array<String, Hash>] args Node name followed by attributes of the node in a Hash.
    # @return [nil]
    def add_child(element, *args)
      element.add_child(element.document.create_element(*args))

      nil
    end
  end
end
