# spec/factories/spendings.rb

FactoryBot.define do
  factory :spending do
    name { 'Dinner' }
    amount { 50.0 }
    association :author, factory: :user
  end
end
