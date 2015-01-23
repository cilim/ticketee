require 'rails_helper'

feature 'Creating users' do
  let!(:admin) { FactoryGirl.create(:admin_user)}
  before do
    sign_in_as!(admin)
    visit '/'
    click_link 'Admin'
    click_link 'Users'
    click_link 'New User'
  end
  scenario 'create user' do
    fill_in "Email", with: "novi@a.at"
    fill_in "Password", with: "password"
    click_button "Create User"
    expect(page).to have_content("User is created successfully")
  end
end