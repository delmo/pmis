class TasksController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 before_action :set_task, only: [:show, :edit, :update, :destroy]
 before_action :set_percentages, only: [:new, :create, :update, :edit]
 after_action :verify_authorized, except:  [:index, :show, :new, :create, :edit]

  def index
   @ppa = Portfolio.find(params[:portfolio_id])
   @tasks = Task.where("portfolio_id = ?", params[:portfolio_id])
   @previous = params[:previous_link]
  end

  def show
  end

  def new
   @ppa = Portfolio.find(params[:portfolio_id])
   if @ppa
    @task = @ppa.tasks.new
   end
  end

  def edit
  end

  def create
   @ppa = Portfolio.find(params[:portfolio_id])
   @task = Task.new(task_params)
   @task.user = current_user
   if @task.save
     redirect_to portfolio_tasks_path(@ppa), notice: 'Task was successfully created.' 
   else
     render action: 'new' 
   end
  end

  def update
   authorize @task
     if @task.update(task_params)
       redirect_to portfolio_tasks_path(@ppa), notice: 'Task was successfully updated.' 
     else
       render action: 'edit' 
     end
  end

  def destroy
   authorize @task
   @task.destroy
   redirect_to portfolio_tasks_path(@ppa) 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
     @ppa = Portfolio.find(params[:portfolio_id])
     @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :start_date, :due_date, :done, :portfolio_id)
    end

    def set_percentages
     @percentages = Task::WORK_PERCENTAGES
    end

   def check_dates
    if (@task.start_date > @ppa.completion) or (@task.due_date > @ppa.completion) or (@task.start_date < @ppa.start) or (@task.due_date < @ppa.start)
     redirect_to portfolio_tasks_path(@ppa), alert: 'Transaction aborted. Please ensure the start and due dates are within the implementation date of the project.' 
    end
   end
end
