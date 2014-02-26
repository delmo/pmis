class ActivitiesController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]

  def index
   @activities = Activity.order("title ASC")
  end

  def show
   @activity = Activity.find(params[:id])
   @riskiness = @activity
   @risks = @riskiness.risks
  end

  def new
   @activity = Activity.new
   @projects = Project.order("title ASC")
   @issues = Issue.order("title ASC")
  end

  def create
   @activity = Activity.new(activity_params)
   if @activity.save
    flash[:success] = "Activity created successfully."
    redirect_to(:action => 'index')
   else
    @projects = Project.order("title ASC")
    @issues = Issue.order("title ASC")
    render('new')
   end
  end

  def edit
   @projects = Project.order("title ASC")
   @activity = Activity.find(params[:id])
   @issues = Issue.order("title ASC")
  end

  def update
   @activity = Activity.find(params[:id])
   if @activity.update_attributes(activity_params)
    flash[:success] = "Activity updated successfully."
    redirect_to(:action => 'index')
   else
    @issues = Issue.order("title ASC")
    @projects = Project.order("title ASC")
    render('edit')
   end
  end

  def delete
   @activity = Activity.find(params[:id])
  end

  def destroy
   activity = Activity.find(params[:id]).destroy
   flash[:success] = "#{activity.title} destroyed successfully."
   redirect_to(:action => 'index')
  end

  private
   def activity_params
    params.require(:activity).permit(:issue_id, :project_id, :title, :description, :performance_indicator, :target, :amount, :start, :completion,  :rank, :visible, :permalink)
   end

end
