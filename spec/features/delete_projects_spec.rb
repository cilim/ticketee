require 'spec_helper'

feature 'Deleting projects' do
  scenario 'deleting a project' do
    project = FactoryGirl.create(:project, name: "Marko")
    visit '/'

    click_link "Marko"
    click_link "Destroy"

    expect(page).to have_content("Project is successfully deleted")
  end
end