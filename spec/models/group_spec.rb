# spec/models/group_spec.rb

require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with a name and icon' do
    group = FactoryBot.build(:group)
    expect(group).to be_valid
  end

  it 'is invalid without a name' do
    group = Group.new(name: nil, icon: 'group_icon.png', user_id: 1)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an icon' do
    group = Group.new(name: 'Friends', icon: nil, user_id: 1)
    group.valid?
    expect(group.errors[:icon]).to include("can't be blank")
  end

  it 'belongs to a user' do
    group = Group.reflect_on_association(:author)
    expect(group.macro).to eq(:belongs_to)
  end

  it 'has many spendings' do
    group = Group.reflect_on_association(:spendings)
    expect(group.macro).to eq(:has_many)
  end
end
