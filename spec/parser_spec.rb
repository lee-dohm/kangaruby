#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'data/parser_data'

describe Parser do
  let(:parser) { Parser.new }

  it 'raises on empty input' do
    expect { parser.parse(nil) }.to raise_error(ArgumentError)
  end

  # it 'creates a model with two participants and one activity' do
  #   model = parser.parse(TestData::ONE_ACTIVITY)

  #   expect(model.participants.count).to eq(2)
  #   expect(model.participants[0].name).to eq('Alice')
  #   expect(model.participants[1].name).to eq('Bob')
  #   expect(model.activity.count).to eq(1)
  #   expect(model.activity[0].from).to eq('Alice')
  #   expect(model.activity[0].to).to eq('Bob')
  # end
end
