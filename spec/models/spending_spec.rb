# spec/models/spending_spec.rb

require 'rails_helper'

RSpec.describe Spending, type: :model do
  it 'is valid with a name, amount, and user_id' do
    spending = build(:spending)
    expect(spending).to be_valid
  end

  it 'is invalid without a name' do
    spending = build(:spending, name: nil)
    spending.valid?
    expect(spending.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an amount' do
    spending = build(:spending, amount: nil)
    spending.valid?
    expect(spending.errors[:amount]).to include("can't be blank")
  end

  it 'is invalid with a negative amount' do
    spending = build(:spending, amount: -10.0)
    spending.valid?
    expect(spending.errors[:amount]).to include('must be greater than or equal to 0')
  end

  it 'belongs to a user' do
    spending = Spending.reflect_on_association(:user)
    expect(spending.macro).to eq(:belongs_to)
  end

  it 'has many groups' do
    spending = Spending.reflect_on_association(:group)
    expect(spending.macro).to eq(:belongs_to)
  end
end
