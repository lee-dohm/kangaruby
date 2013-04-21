#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Model do
  let(:model) { Model.new }

  it 'starts with no participants or actions' do
    expect(model.participants.count).to eq(0)
    expect(model.actions.count).to eq(0)
  end

  it 'accepts new participants' do
    model.participants << Participant.new('Alice')

    expect(model.participants).to eq(participants('Alice'))
  end

  it 'does not add a second participant with the same name' do
    model.participants << Participant.new('Alice')
    model.participants << Participant.new('Alice')

    expect(model.participants).to eq(participants('Alice'))
  end

  it 'accepts new actions' do
    model.actions << Action.new('Alice', 'Bob')

    expect(model.actions).to eq(actions(['Alice', 'Bob']))
  end

  it 'accepts two identical actions' do
    model.actions << Action.new('Alice', 'Bob')
    model.actions << Action.new('Alice', 'Bob')

    expect(model.actions).to eq(actions(['Alice', 'Bob'], ['Alice', 'Bob']))
  end
end
