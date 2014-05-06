class LocationsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 before_action :set_location, only: [:show, :edit, :update, :destroy]
 after_action :verify_authorized, except:  [:index, :show]

  def index
   @ppa = Portfolio.find(params[:portfolio_id])
   @locations = Location.where("portfolio_id = ?", params[:portfolio_id])
  end

  def show
  end

  def new
   @ppa = Portfolio.find(params[:portfolio_id])
   if @ppa
    @location = @ppa.locations.new
    authorize @location
   end
  end

  def edit
   authorize @location
  end

  def create
   @ppa = Portfolio.find(params[:portfolio_id])
    @location = Location.new(location_params)
    authorize @location
    @location.user = current_user
     if @location.save
      redirect_to portfolio_locations_path(@ppa), notice: "Location was successfully created."
     else
      render action: 'new'
     end
  end

  def update
   authorize @location
    if @location.update(location_params)
     redirect_to portfolio_locations_path(@ppa), notice: "Location was successfully updated."
    else
     render action: 'edit'
    end
  end

  def destroy
    authorize @location
    @location.destroy
    redirect_to portfolio_locations_path(@ppa)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
     @ppa = Portfolio.find(params[:portfolio_id])
     @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:address, :latitude, :longitude, :portfolio_id)
    end
end
