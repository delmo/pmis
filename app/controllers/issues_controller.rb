class IssuesController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
  def index
   @issues = Issue.order("created_at DESC")
  end

  def show
   @issue = Issue.find(params[:id])
  end

  def new
   @issue = Issue.new
   @departments = Department.order("name ASC")
  end

  def create
   @issue = Issue.new(issue_params)
   if @issue.save
    flash[:success] = "Issue created successfully."
    redirect_to(:action => 'index')
   else
    @departments = Department.order("name ASC")
    render('new')
   end
  end

  def edit
   @issue = Issue.find(params[:id])
   @departments = Department.order("name ASC")
  end

  def update
   @issue = Issue.find(params[:id])
   @departments = Department.order("name ASC")
   if @issue.update_attributes(issue_params)
    flash[:success] = "Issue updated succesfully."
    redirect_to @issue
   else
    @departments = Department.order("name ASC")
    render action: 'edit'
   end
  end

  def delete
   @issue = Issue.find(params[:id])
  end

  def destroy
   issue = Issue.find(params[:id]).destroy
   flash[:success] = "#{issue.title} destroyed successfully."
   redirect_to(:action => 'index')
  end

  private
   def issue_params
    params.require(:issue).permit(:department_id, :title, :implication, :intervention)
   end

end
