require 'rails_helper'

feature 'Signing out' do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    sign_in_as!(user)
    visit '/'
  end
  scenario 'user sign out' do
    click_link 'Sign out'

    expect(page).to have_content("You have signed out successfully")
  end
end