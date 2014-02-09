class DepartmentsController < ApplicationController
  def index
   @departments = Department.order("name ASC")
  end

  def show
   @department = Department.find(params[:id])
  end

  def new
   @department = Department.new
   @sectors = Sector.order("name ASC")
  end

  def create
   @department = Department.new(department_params)
   @sectors = Sector.order("name ASC")
   if @department.save
    flash[:notice] = "Department created successfully."
    redirect_to(:action => 'index')
   else
    @sectors = Sector.order("name ASC")
    render('new')
   end
  end

  def edit
   @department = Department.find(params[:id])
   @sectors = Sector.order("name ASC")
  end

  def update
   @department = Department.find(params[:id])
   @sectors = Sector.order("name ASC")
   if @department.update_attributes(department_params)
    flash[:notice] = "Department updated successfully."
    redirect_to(:action => 'show', :id => @department.id)
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
   flash[:notice] = "#department.name destroyed successfully."
   redirect_to(:action => 'index')
  end

  private 

   def department_params
    params.require(:department).permit(:sector_id, :name, :description, :telephone, :email)
   end
end
