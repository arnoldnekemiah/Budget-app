require 'rails_helper'

RSpec.describe GroupSpending, type: :model do
  it 'belongs to a group' do
    group_spending = GroupSpending.reflect_on_association(:group)
    expect(group_spending.macro).to eq(:belongs_to)
  end

  it 'belongs to a spending' do
    group_spending = GroupSpending.reflect_on_association(:spending)
    expect(group_spending.macro).to eq(:belongs_to)
  end
end
