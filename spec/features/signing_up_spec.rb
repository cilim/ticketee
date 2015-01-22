require 'rails_helper'

feature 'Signing up users' do
  scenario 'user is signing up' do
    visit '/'

    click_link 'Sign up'
    fill_in 'Email', with: "os.chilim@gmail.com"
    fill_in "Password", with: "adminadmin"
    fill_in "Password confirmation", with: "adminadmin"
    click_button "Sign up"

    expect(page).to have_content("You have successfully signed up")
  end
end