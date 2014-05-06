class DepartmentsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 after_action :verify_authorized, except:  [:index, :show]
  def index
   @departments = Department.order("name ASC")
  end

  def show
   @department = Department.find(params[:id])
  end

  def new
   @department = Department.new
   authorize @department
   @sectors = Sector.order("name ASC")
  end

  def create
   @department = Department.new(department_params)
   authorize @department
   @department.user = current_user
   @sectors = Sector.order("name ASC")
   if @department.save
    flash[:success] = "Department created successfully."
    redirect_to(:action => 'index')
   else
    @sectors = Sector.order("name ASC")
    render('new')
   end
  end

  def edit
   @department = Department.find(params[:id])
   authorize @department
   @sectors = Sector.order("name ASC")
  end

  def update
   @department = Department.find(params[:id])
   authorize @department
   @sectors = Sector.order("name ASC")
   if @department.update_attributes(department_params)
    flash[:success] = "Department updated successfully."
    redirect_to @department
   else
    @sectors = Sector.order("name ASC")
    render('edit')
   end
  end

  def delete
   @department = Department.find(params[:id])
  end

  def destroy
   department = Department.find(params[:id]).destroy
   authorize department
   flash[:success] = "#{department.name} destroyed successfully."
   redirect_to(:action => 'index')
  end

  private 

   def department_params
    params.require(:department).permit(:sector_id, :name, :description, :telephone, :email)
   end
end
