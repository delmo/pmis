class ProjectsController < ApplicationController
  def index
   @projects = Project.order("title ASC")
  end

  def show
   @project = Project.find(params[:id])
  end

  def new
   @project = Project.new
   @programs = Program.order("title ASC")
   @issues = Issue.order("title ASC")
  end

  def create
   @project = Project.new(project_params)
   if @project.save
    flash[:notice] = "Project created successfully."
    redirect_to(:action => 'index')
   else
    @programs = Program.order("title ASC")
    @issues = Issue.order("title ASC")
    render('new')
   end
  end

  def edit
   @programs = Program.order("title ASC")
   @project = Project.find(params[:id])
   @issues = Issue.order("title ASC")
  end

  def update
   @project = Project.find(params[:id])
   if @project.update_attributes(project_params)
    flash[:notice] = "Project updated successfully."
    redirect_to(:action => 'show', :id => @project.id)
   else
    @issues = Issue.order("title ASC")
    @programs = Program.order("title ASC")
    render('edit')
   end
  end

  def delete
   @project = Project.find(params[:id])
  end

  def destroy
   project = Project.find(params[:id]).destroy
   flash[:notice] = "#{project.title} destroyed successfully."
   redirect_to(:action => 'index')
  end

  private
   def project_params
    params.require(:project).permit(:issue_id, :program_id, :title, :description, :performance_indicator, :target, :amount, :start, :completion,  :rank, :visible, :permalink)
   end

end