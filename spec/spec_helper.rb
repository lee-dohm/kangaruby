#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'simplecov'
SimpleCov.start do
  add_filter 'grammar/'
end

require 'rspec'

require 'kangaruby'

include KangaRuby
