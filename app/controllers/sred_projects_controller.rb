class SredProjectsController < ApplicationController

  def index
    @sred_projects = SredProject.all
  end

  def new
    @sred_project = SredProject.new
  end

  def create
    @sred_project = SredProject.create(sred_project_params)
    if @sred_project.save
      flash[:success] = "Project created."
      redirect_to sred_projects_path
    else
      render "new"
    end
  end

  private
    def sred_project_params
      params.require(:sred_project).permit(:title)
    end

end
