class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order('created_at DESC')
  end

  def show
    @project = Project.find(params[:id])
    @projects = Project.where.not(id: params[:id]).order("created_at desc").limit(4)
  end

  private
  def project_params
    params.require(:project).permit(:title,:body)
  end
end
