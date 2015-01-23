require 'rails_helper'

feature 'Creating Tickets' do

  before do
    project = FactoryGirl.create(:project, name: "Marko")
    user = FactoryGirl.create(:user, email: "os.chilim@gmail.com")
    visit "/"
    click_link project.name
    click_link "New ticket"
    expect(page).to have_content("You need to sign in or sign up before continuing.")

    fill_in "Email", with: 'os.chilim@gmail.com'
    fill_in "Password", with: 'adminadmin'
    click_button "Sign in"
    visit '/'

    click_link project.name
    click_link "New ticket"
  end

  scenario 'creating a ticket' do
    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Some description"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket is successfully created")
    within "#ticket #author" do
      expect(page).to have_content("Created by os.chilim@gmail.com")
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