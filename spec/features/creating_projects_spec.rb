require 'spec_helper'

feature 'Creating projects' do
  scenario "can create a project" do
    visit '/'

    click_link 'New project'

    fill_in 'Name', with: 'First'
    fill_in 'Description', with: 'Description of first project'
    click_button 'Create project'

    expect(page).to have_content('Project has been created.')

    project = Project.where(name: "First").first
    expect(page.current_url).to eql(project_url(project))

    title = "First - Projects - Ticketee"
    expect(page).to have_title(title)
  end

end