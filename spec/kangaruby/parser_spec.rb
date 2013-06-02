#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Parser do
  let(:parser) { Parser.new }
  let(:one_action) { FactoryGirl.create(:one_action) }
  let(:two_actions) { FactoryGirl.create(:two_actions) }
  let(:syntax_error) { FactoryGirl.create(:syntax_error) }

  it 'raises on empty input' do
    expect { parser.parse(nil) }.to raise_error(ArgumentError)
  end

  it 'creates a model with two participants and one action' do
    model = parser.parse(one_action)

    expect(model.participants.all? { |p| p.instance_of? Participant }).to be_true
    expect(model.participants).to eq(participants('Alice', 'Bob'))
    expect(model.actions).to eq(actions(%w(Alice Bob)))
  end

  it 'creates a model with two participants and two actions' do
    model = parser.parse(two_actions)

    expect(model.participants.all? { |p| p.instance_of? Participant }).to be_true
    expect(model.participants).to eq(participants('Alice', 'Bob'))
    expect(model.actions).to eq(actions(['Alice', 'Bob', :solid], ['Bob', 'Alice', :dotted]))
  end

  it 'raises an exception on syntax errors' do
    expect { parser.parse(syntax_error) }.to raise_error(KangaRuby::ParseError)
  end
end
