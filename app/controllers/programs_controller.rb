class ProgramsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
  def index
   @programs = Program.order("title ASC")
  end

  def show
   @program = Program.find(params[:id])
  end

  def new
   @program = Program.new
   @issues = Issue.order("title ASC")
  end

  def create
   @program = Program.new(program_params)
   if @program.save
    flash[:success] = "Program created successfully."
    redirect_to(:action => 'index')
   else
    @issues = Issue.order("title ASC")
    render('new')
   end
  end

  def edit
   @program = Program.find(params[:id])
   @issues = Issue.order("title ASC")
  end

  def update
   @program = Program.find(params[:id])
   if @program.update_attributes(program_params)
    flash[:success] = "Program updated successfully."
    redirect_to(:action => 'show', :id => @program.id)
   else
    @issues = Issue.order("title ASC")
    render('edit')
   end
  end

  def delete
   @program = Program.find(params[:id])
  end

  def destroy
   program = Program.find(params[:id]).destroy
   flash[:success] = "#{program.title} destroyed successfully."
   redirect_to(:action => 'index')
  end

  private
   def program_params
    params.require(:program).permit(:issue_id, :title, :description, :performance_indicator, :target, :amount, :start, :completion,  :rank, :visible, :permalink, :is_risky, :not_in_line, :not_related, :not_pest)
   end

end
