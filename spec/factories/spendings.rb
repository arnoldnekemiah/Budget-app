# spec/factories/spendings.rb

FactoryBot.define do
  factory :spending do
    name { 'Dinner' }
    amount { 50.0 }
    association :user, factory: :user
    association :group, factory: :group
  end
end
