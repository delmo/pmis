class RisksController < ApplicationController
  def index
   @risks = Risk.order("created_at DESC")
  end

  def show
   @risk = Risk.find(params[:id])
  end

  def new
   @risk = Risk.new
   @programs = Program.order("title ASC")
   @projects = Project.order("title ASC")
   @activities = Activity.order("title ASC")
  end

  def create
   @risk = Risk.new(risk_params)
   if @risk.save
    flash[:success] = "risk created successfully."
    redirect_to(:action => 'index')
   else
    @programs = Program.order("title ASC")
    @projects = Project.order("title ASC")
    @activities = Activity.order("title ASC")
    render('new')
   end
  end

  def edit
   @risk = Risk.find(params[:id])
   @programs = Program.order("title ASC")
   @projects = Project.order("title ASC")
   @activities = Activity.order("title ASC")
  end

  def update
   @risk = Risk.find(params[:id])
   if @risk.update_attributes(risk_params)
    flash[:success] = "risk updated succesfully."
    redirect_to(:action => 'show', :id => @risk.id)
   else
    @programs = Program.order("title ASC")
    @projects = Project.order("title ASC")
    @activities = Activity.order("title ASC")
    render('edit')
   end
  end

  def delete
   @risk = Risk.find(params[:id])
  end

  def destroy
   risk = risk.find(params[:id]).destroy
   flash[:success] = "#{risk.title} destroyed successfully."
   redirect_to(:action => 'index')
  end


  private
   def risk_params
    params.require(:risk).permit(:program_id, :project_id, :activity_id, :title, :description, :category, :probability, :severity, :mitigation)
   end

end
