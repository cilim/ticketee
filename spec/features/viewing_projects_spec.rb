require 'spec_helper'

feature 'Viewing projects' do
  scenario 'view all projects' do
    project = FactoryGirl.create(:project, name: "Marko", description: "Marko desc")
    visit '/'
    click_link "Marko"
    expect(page.current_url).to eql(project_url(project))
  end
end