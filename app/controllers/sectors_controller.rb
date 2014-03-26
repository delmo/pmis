class SectorsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
  def index
   @sectors = Sector.order("name ASC")
  end

  def show
   @sector = Sector.find(params[:id])
  end

  def new
   @sector = Sector.new
   @city = City.first
  end

  def create
   @sector = Sector.new(sector_params)
   if @sector.save
    flash[:success] = "Sector created successfully."
    redirect_to(:action => 'index')
   else
    @city = City.first
    render('new')
   end
  end 

  def edit
   @sector = Sector.find(params[:id])
   @city = City.first
  end

  def update
   @sector = Sector.find(params[:id])
   if @sector.update_attributes(sector_params)
    flash[:success] = "Sector updated successfully."
    redirect_to(:action => 'show', :id => @sector.id)
   else
    @city = City.first
    render('edit')
   end
  end

  def delete
   @sector = Sector.find(params[:id])
  end

  def destroy
   sector = Sector.find(params[:id]).destroy
   flash[:success] = "#{sector.name} destroyed successfully."
   redirect_to(:action => 'index')
  end

  private 
   def sector_params
    params.require(:sector).permit(:city_id, :name, :description, :goal, :development_thrust, :objective, :desired_outcome, :required_policy)
   end

end
