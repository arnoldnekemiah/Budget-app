# spec/factories/groups.rb

FactoryBot.define do
  factory :group do
    name { 'Sample Group' }
    icon do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec', 'fixtures', 'images', 'dp.png'),
        'image/png'
      )
    end
    user_id { FactoryBot.create(:user).id }  # associate with a user by creating one
  end
end
