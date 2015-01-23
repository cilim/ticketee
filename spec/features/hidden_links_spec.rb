require 'rails_helper'

feature "hidden links" do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin_user) }
  let(:project) { FactoryGirl.create(:project) }
  context "anonymous users" do
    scenario "cannot see the New Project link" do
      visit '/'
      assert_no_link_for "New project"
    end
    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      assert_no_link_for "Edit"
    end
    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      assert_no_link_for "Destroy"
    end
  end
  context "regular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Project link" do
      visit '/'
      assert_no_link_for "New project"
    end
    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      assert_no_link_for "Edit"
    end
    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      assert_no_link_for "Destroy"
    end
  end
  context "admin users" do
    before { sign_in_as!(admin) }
    scenario "can see the New Project link" do
      visit '/'
      assert_link_for "New project"
    end
    scenario "can see the Edit Project link" do
      visit project_path(project)
      assert_link_for "Edit"
    end
    scenario "can see the Delete Project link" do
      visit project_path(project)
      assert_link_for "Destroy"
    end
  end
end