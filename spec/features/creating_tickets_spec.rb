require 'rails_helper'

feature 'Creating Tickets' do

  before do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)
    define_permission!(user, "view", project)
    @email = user.email
    sign_in_as!(user)
    visit "/"
    click_link project.name
    click_link "New ticket"
  end

  scenario 'creating a ticket' do
    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Some description"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket is successfully created")
    within "#ticket #author" do
      expect(page).to have_content("Created by #{@email}")
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