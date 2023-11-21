require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = User.new(name: 'John Doe')
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'has many spendings' do
    user = User.reflect_on_association(:spendings)
    expect(user.macro).to eq(:has_many)
  end

  it 'has many groups' do
    user = User.reflect_on_association(:groups)
    expect(user.macro).to eq(:has_many)
  end
end
