class ProgramsController < ApplicationController
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
    flash[:notice] = "Program created successfully."
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
    flash[:notice] = "Program updated successfully."
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
   flash[:notice] = "#{program.title} destroyed successfully."
   redirect_to(:action => 'index')
  end

  private
   def program_params
    params.require(:program).permit(:issue_id, :title, :description, :performance_indicator, :target, :amount, :start, :completion,  :rank, :visible, :permalink)
   end

end
