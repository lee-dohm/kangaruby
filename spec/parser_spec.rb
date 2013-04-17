#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'spec_helpers'

require 'kangaruby'

include KangaRuby

describe Parser do
  let(:parser) { Parser.new }

  it 'raises on empty input' do
    expect { parser.parse(nil) }.to raise_error(ArgumentError)
  end
end
