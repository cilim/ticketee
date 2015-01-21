require 'spec_helper'

feature 'Creating projects' do

  before do
    visit "/"
    click_link "New project"
  end

  scenario "can create a project" do
    fill_in 'Name', with: 'First'
    fill_in 'Description', with: 'Description of first project'
    click_button 'Create Project'

    expect(page).to have_content('Project has been created.')

    project = Project.where(name: "First").first
    expect(page.current_url).to eql(project_url(project))

    title = "First - Projects - Ticketee"
    expect(page).to have_title(title)
  end

  scenario "can no create a project without a name" do
    click_button "Create Project"
    expect(page).to have_content("Project has not been created")
    expect(page).to have_content("Name can't be blank")

  end

end