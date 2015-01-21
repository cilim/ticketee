require 'spec_helper'

feature 'Can edit projects' do
  before do
    project = FactoryGirl.create(:project, name: "Marko")
    visit '/'
    click_link "Edit"
  end
  scenario 'editing a project' do
    fill_in "Name", with: "Marko2"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated")
    expect(page).to have_content("Marko2")
  end

  scenario 'editing a project without a name' do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Project has not been updated")
  end
end