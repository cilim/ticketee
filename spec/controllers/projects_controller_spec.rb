require 'rails_helper'

describe ProjectsController do

  it "display an error for a missing project" do
    get :show, id: 'not-here'
    expect(response).to redirect_to(projects_path)
    expect(flash[:alert]).to eql("The project you were looking for couldn't be found")
  end

end