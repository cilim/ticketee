require 'rails_helper'

feature 'User profile' do
  scenario 'viewing user profile' do
    user = FactoryGirl.create(:user)

    visit user_path(user)

    expect(page).to have_content(user.email)
  end

  scenario 'editing user profile' do
    user = FactoryGirl.create(:user)

    visit user_path(user)

    click_link 'Edit profile'
    fill_in "Email", with: "alala@gmail.com"
    click_button "Update"

    expect(page).to have_content("Profile has been updated")
  end
end