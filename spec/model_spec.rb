#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

describe Model do
  let(:model) { Model.new }

  it 'will have no participants or activities by default' do
    expect(model.participants.count).to eq(0)
    expect(model.activities.count).to eq(0)
  end

  it 'will accept new participants' do
    model.participants << Participant.new('Alice')

    expect(model.participants.count).to eq(1)
    expect(model.participants[0].name).to eq('Alice')
  end

  it 'will not add a second participant with the same name' do
    model.participants << Participant.new('Alice')
    model.participants << Participant.new('Alice')

    expect(model.participants.count).to eq(1)
    expect(model.participants[0].name).to eq('Alice')
  end

  it 'will accept new activities' do
    model.activities << Activity.new('Alice', 'Bob')

    expect(model.activities.count).to eq(1)
    expect(model.activities[0].from).to eq('Alice')
    expect(model.activities[0].to).to eq('Bob')
  end

  it 'will accept two identical activities' do
    model.activities << Activity.new('Alice', 'Bob')
    model.activities << Activity.new('Alice', 'Bob')

    expect(model.activities.count).to eq(2)
    expect(model.activities[0].from).to eq('Alice')
    expect(model.activities[0].to).to eq('Bob')
    expect(model.activities[1].from).to eq('Alice')
    expect(model.activities[1].to).to eq('Bob')
  end
end
