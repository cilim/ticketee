class ProjectsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show]
  before_action :require_signin!, only: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

  def index
    @projects = Project.for(current_user)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project has been created.'
    else
      flash[:alert] = "Project has not been created"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project has been updated'
    else
      flash[:alert] = "Project has not been updated"
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: 'Project is successfully deleted'
    end
  end

  protected
    def error_not_found
      flash[:alert] = "The project you were looking for couldn't be found"
      redirect_to projects_path
    end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end

    def set_project
      @project = Project.for(current_user).find(params[:id])
    end

end
