#####################################
# WARNING THIS CLASS IS NOT IN USED #
#####################################



class ProjectsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
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
   @departments = Department.order("name ASC")
  end

  def create
   @project = Project.new(project_params)
   if @project.save
    flash[:success] = "Project created successfully."
    redirect_to(:action => 'index')
   else
    @programs = Program.order("title ASC")
    @issues = Issue.order("title ASC")
   @departments = Department.order("name ASC")
    render('new')
   end
  end

  def edit
   @programs = Program.order("title ASC")
   @project = Project.find(params[:id])
   @issues = Issue.order("title ASC")
   @departments = Department.order("name ASC")
  end

  def update
   @project = Project.find(params[:id])
   if @project.update_attributes(project_params)
    flash[:success] = "Project updated successfully."
    redirect_to(:action => 'show', :id => @project.id)
   else
    @issues = Issue.order("title ASC")
    @programs = Program.order("title ASC")
   @departments = Department.order("name ASC")
    render('edit')
   end
  end

  def delete
   @project = Project.find(params[:id])
  end

  def destroy
   project = Project.find(params[:id]).destroy
   flash[:success] = "#{project.title} destroyed successfully."
   redirect_to(:action => 'index')
  end

  private
   def project_params
    params.require(:project).permit(:issue_id, :program_id, :title, :description, :performance_indicator, :target, :amount, :start, :completion,  :rank, :visible, :permalink, :is_risky, :not_in_line, :not_related, :not_pest, :department_id)
   end

end
