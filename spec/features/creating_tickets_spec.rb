require 'rails_helper'

feature 'Creating Tickets' do

  before do
    project = FactoryGirl.create(:project, name: "Marko")
    user = FactoryGirl.create(:user)
    visit "/"
    click_link project.name
    click_link "New ticket"
    expect(page).to have_content("You need to sign in before continuing")

    fill_in "Email"
    fill_in "Password"
    click_button "Sign in"

    click_link project.name
    click_link "New ticket"
  end

  scenario 'creating a ticket' do
    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Some description"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket is successfully created")
    within "#ticket #author" do
      expect(page).to have_content("Created by sample@example.com")
    end
  end

  scenario 'creating a ticket without valid attributes' do
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario 'Description must be longer than 10 characters' do
    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Some des"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created")
    expect(page).to have_content("Description is too short")
  end

end