class CitiesController < ApplicationController
  def index
   @cities = City.order("postcode ASC")
  end

  def show
   @city = City.find_by_id(params[:id])
  end

  def new
   @city = City.new
  end

  def create
   @city = City.new(city_params)
   if @city.save
    flash[:success] = "City created successfully."
    redirect_to(:action => 'index')
   else
    render('new')
   end
  end

  def edit
   @city = City.find(params[:id])
  end

  def update
   @city = City.find(params[:id])
   if @city.update_attributes(city_params)
    flash[:success] = "City updated successfully."
    redirect_to(:action => 'show', :id => @city.id)
   else
    render('edit')
   end
  end

  def delete
   @city = City.find(params[:id])
  end

  def destroy
   city = City.find(params[:id]).destroy
   flash[:success] = "#{city.name} city destroyed successfully."
   redirect_to(:action => 'index')
  end

  private

   def city_params
    params.require(:city).permit(:name, :address, :postcode, :telephone, :website, :email, :vision, :mission, :development_thrust)
   end
end
