# Controller for City or Municipality detials

class CitiesController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 after_action :verify_authorized, except:  [:index, :show]

  # home page action
  def index
   @cities = City.order("postcode ASC")
  end

  # show individual record
  def show
   @city = City.find_by_id(params[:id])
  end

  # create new city record
  def new
   @city = City.new
   authorize @city
  end

  # save new city record
  def create
   @city = City.new(city_params)
   authorize @city
   @city.user = current_user
   if @city.save
    flash[:success] = "City created successfully."
    redirect_to(:action => 'index')
   else
    render('new')
   end
  end

  # edit existing city record
  def edit
   @city = City.find(params[:id])
   authorize @city
  end

  # update existing city record
  def update
   @city = City.find(params[:id])
   authorize @city
   if @city.update_attributes(city_params)
    flash[:success] = "City updated successfully."
    redirect_to(:action => 'show', :id => @city.id)
   else
    render('edit')
   end
  end

  # delete city record
  def delete
   @city = City.find(params[:id])
  end

  # permanently delete city record from database
  def destroy
   city = City.find(params[:id]).destroy
   authorize city
   flash[:success] = "#{city.name} city destroyed successfully."
   redirect_to(:action => 'index')
  end

  private

  # Only allow parameter listed here
   def city_params
    params.require(:city).permit(:name, :address, :postcode, :telephone, :website, :email, :vision, :mission, :development_thrust)
   end
end
