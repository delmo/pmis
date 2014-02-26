class RelationsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 before_filter :load_linkable

  def index
   @relations = @linkable.relations
  end

  def show
   @relation = @linkable.relations.find(params[:id])
  end

  def new
   @relation = @linkable.relations.new
  end

  def create
   @relation = @linkable.relations.new(relation_params)
   if @relation.save
    flash[:success] = "Relation created successfully."
    redirect_to [@linkable, :relations]
   else
    render('new')
   end
  end

  def edit
   @relation = @linkable.relations.find(params[:id])
  end

  def update
   @relation = @linkable.relations.find(params[:id])
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
