############################################
# Cotroller for ranking criteria
# If the project align with
# Political, Economic, Social and Technology
# #########################################
#
class PestsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 before_filter :load_feasible
 after_action :verify_authorized, except:  [:index, :show]

  def index
   @pests = @feasible.pests
  end

  def show
   @pest = @feasible.pests.find(params[:id])
  end

  def new
   @pest = @feasible.pests.new
   authorize @pest
  end

  def create
   @pest = @feasible.pests.new(pest_params)
   authorize @pest
   @pest.user = current_user
   if @pest.save
    flash[:success] = "PEST created successfully."
    redirect_to [@feasible, :pests]
   else
    render('new')
   end
  end

  def edit
   @pest = @feasible.pests.find(params[:id])
   authorize @pest
  end

  def update
   @pest = @feasible.pests.find(params[:id])
   authorize @pest
   if @pest.update_attributes(pest_params)
    flash[:success] = "PEST updated succesfully."
    redirect_to [@feasible, :pests]
   else
    render('edit')
   end
  end

  def delete
   @pest = @feasible.pests.find(params[:id])
  end


  def destroy
   pest = @feasible.pests.find(params[:id]).destroy
   authorize pest
   flash[:success] = "#{pest.title} destroyed successfully."
   redirect_to [@feasible, :pests]
  end


  private
   def pest_params
    params.require(:pest).permit(:title, :description, :justification)
   end

   def load_feasible
    resource, id = request.path.split('/')[1,2]
    @feasible = resource.singularize.classify.constantize.find(id) # Activity.find(1)
   end

end
