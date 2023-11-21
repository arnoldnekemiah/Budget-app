FactoryBot.define do
  factory :group do
    name { 'Friends' }
    icon { 'group_icon.png' }
    association :author, factory: :user
  end
end
