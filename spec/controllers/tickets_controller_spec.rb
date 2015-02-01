require 'rails_helper'

describe TicketsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project)}
  let(:ticket) { FactoryGirl.create(:ticket, project: project, user: user)}
  before do
    sign_in(user)
  end

  context 'standard users' do
    it "cannot access a ticket for a project" do
      get :show, id: ticket.id, project_id: project.id
      expect(flash[:alert]).to eql("The project you were looking for couldn't be found")
    end
  end
end