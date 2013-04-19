#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

require 'data/parser_data'

describe Parser do
  let(:parser) { Parser.new }

  it 'raises on empty input' do
    expect { parser.parse(nil) }.to raise_error(ArgumentError)
  end

  it 'creates a model with two participants and one activity' do
    model = parser.parse(TestData::ONE_ACTIVITY)

    expect(model.participants).to eq(['Alice', 'Bob'])
    expect(model.activities).to eq([Activity.new('Alice', 'Bob')])
  end

  it 'creates a model with two participants and two activities' do
    model = parser.parse(TestData::TWO_ACTIVITIES)

    expect(model.participants).to eq(['Alice', 'Bob'])
    expect(model.activities).to eq([Activity.new('Alice', 'Bob', :solid), Activity.new('Bob', 'Alice', :dotted)])
  end

  it 'raises an exception on syntax errors' do
    expect { parser.parse(TestData::SYNTAX_ERROR) }.to raise_error(ParseError)
  end
end
