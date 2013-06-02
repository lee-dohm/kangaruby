#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

class Module
  # @api monkeypatch
  #
  # Creates an alias for an attribute on a module or class.
  #
  # @param new_attr New name for the attribute.
  # @param original Original name for the attribute.
  # @return [void]
  def attr_alias(new_attr, original)
    alias_method(new_attr, original) if method_defined? original
    new_writer = "#{new_attr}="
    original_writer = "#{original}="
    alias_method(new_writer, original_writer) if method_defined? original_writer
  end
end
