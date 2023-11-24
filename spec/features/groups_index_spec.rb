require 'rails_helper'

RSpec.feature 'Groups Index', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  before(:each) do
    user = FactoryBot.create(:user, confirmed_at: Time.now)
    sign_in user
  end

  scenario 'User can see all categories' do
    # Your test steps go here
    visit groups_path

    expect(page).to have_content('All Categories')
    expect(page).to have_link('Sign out', href: destroy_user_session_path)
    # Add more expectations based on your view structure and content
  end

  # Add more scenarios as needed
end