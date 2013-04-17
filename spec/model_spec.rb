#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'spec_helpers'

require 'kangaruby'

include KangaRuby

describe Model do
  let(:model) { Model.new }

  it 'will have no columns or rows by default' do
    expect(model.columns.count).to eq(0)
    expect(model.rows.count).to eq(0)
  end
end
