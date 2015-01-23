require 'rails_helper'

feature 'Signing in' do
  scenario 'user sign in' do
    user = FactoryGirl.create(:user, email: "os.chilim@gmail.com")

    visit '/'
    click_link 'Sign in'
    fill_in "Email", with: "os.chilim@gmail.com"
    fill_in "Password", with: "adminadmin"
    click_button "Sign in"

    expect(page).to have_content("You have signed in successfully")
  end
end