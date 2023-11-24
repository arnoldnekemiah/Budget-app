require 'rails_helper'

RSpec.feature 'Groups New', type: :feature do
  let(:user) { create(:user) }

  before(:each) do
    user = FactoryBot.create(:user, confirmed_at: Time.now)
    sign_in user
  end

  scenario 'User can add a new category' do
    # Your test steps go here
    visit new_group_path

    fill_in 'group_name', with: 'New Category'
    attach_file('group_icon', Rails.root.join('spec', 'fixtures', 'images', 'dp.png'))

    click_button 'Add Category'

    expect(page).to have_content('New Category')
  end
end