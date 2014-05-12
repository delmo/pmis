###############################################
# Controller for criteria on Ranking projects
# See if project sounds politically or socially feasible
# #################################################
#
class RelationsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 before_filter :load_linkable
 after_action :verify_authorized, except:  [:index, :show]

  def index
   @relations = @linkable.relations
  end

  def show
   @relation = @linkable.relations.find(params[:id])
  end

  def new
   @relation = @linkable.relations.new
   authorize @relation
  end

  def create
   @relation = @linkable.relations.new(relation_params)
   authorize @relation
   @relation.user = current_user
   if @relation.save
    flash[:success] = "Relation created successfully."
    redirect_to [@linkable, :relations]
   else
    render('new')
   end
  end

  def edit
   @relation = @linkable.relations.find(params[:id])
   authorize @relation
  end

  def update
   @relation = @linkable.relations.find(params[:id])
   authorize @relation
   if @relation.update_attributes(relation_params)
    flash[:success] = "Relation updated succesfully."
    redirect_to [@linkable, :relations]
   else
    render('edit')
   end
  end

  def delete
   @relation = @linkable.relations.find(params[:id])
  end


  def destroy
   relation = @linkable.relations.find(params[:id]).destroy
   authorize relation
   flash[:success] = "#{relation.title} destroyed successfully."
   redirect_to [@linkable, :relations]
  end


  private
   def relation_params
    params.require(:relation).permit(:title, :description, :justification)
   end

   def load_linkable
    resource, id = request.path.split('/')[1,2]
    @linkable = resource.singularize.classify.constantize.find(id) # Activity.find(1)
   end

end
