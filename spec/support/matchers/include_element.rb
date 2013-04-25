#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'nokogiri'

RSpec::Matchers.define :include_element do |name, attrs|
  # Matches if any of the nodes in the nodeset satisfy all the following criteria:
  #
  # 1. Name of the node is equal to `name`
  # 2. All of the keys and values in the `attrs` hash match attributes on the node.
  #
  # Note: This means that additional attributes can be present other than the ones specified in `attrs` and they *will not*
  # be validated.
  match do |actual|
    actual.any? do |node|
      if attrs.nil?
        node.name == name
      else
        node.name == name &&
        attrs.all? do |k, v|
          node.attributes[k.to_s].value == v.to_s
        end
      end
    end
  end

  failure_message_for_should do |actual|
    <<-EOS
expected: <#{name} #{dump_attrs(attrs)} />
      in: [
#{dump_nodeset(actual, 12)}
          ]
EOS
  end

  failure_message_for_should_not do |actual|
    <<-EOS
    expected: <#{name} #{dump_attrs(attrs)} />
to not be in: [
#{dump_nodeset(actual, 16)}
              ]
EOS
  end

  def dump_attrs(attrs)
    arr = attrs.map do |k, v|
      "#{k}=\"#{v}\""
    end

    arr.join(' ')
  end

  def dump_nodeset(set, indent)
    message = ''

    set.each do |node|
      next unless node.element?

      message << ' ' * indent << node.to_s << "\n"
    end

    message.chomp
  end
end
