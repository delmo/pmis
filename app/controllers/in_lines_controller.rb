##############################################
# Criteria for ranking a project
# If the project is in line with City's
# Vision and Mission and have Resources
# ###########################################
#
class InLinesController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 before_filter :load_achievable
 after_action :verify_authorized, except:  [:index, :show]

  def index
   @in_lines = @achievable.in_lines
  end

  def show
   @in_line = @achievable.in_lines.find(params[:id])
  end

  def new
   @in_line = @achievable.in_lines.new
   authorize @in_line
  end

  def create
   @in_line = @achievable.in_lines.new(in_line_params)
   authorize @in_line
   @in_line.user = current_user
   if @in_line.save
    flash[:success] = "In-line created successfully."
    redirect_to [@achievable, :in_lines]
   else
    render('new')
   end
  end

  def edit
   @in_line = @achievable.in_lines.find(params[:id])
   authorize @in_line
  end

  def update
   @in_line = @achievable.in_lines.find(params[:id])
   authorize @in_line
   if @in_line.update_attributes(in_line_params)
    flash[:success] = "In-line updated succesfully."
    redirect_to [@achievable, :in_lines]
   else
    render('edit')
   end
  end

  def delete
   @in_line = @achievable.in_lines.find(params[:id])
  end


  def destroy
   in_line = @achievable.in_lines.find(params[:id]).destroy
   authorize in_line
   flash[:success] = "#{in_line.title} destroyed successfully."
   redirect_to [@achievable, :in_lines]
  end


  private
   def in_line_params
    params.require(:in_line).permit(:title, :description, :justification)
   end

   def load_achievable
    resource, id = request.path.split('/')[1,2]
    @achievable = resource.singularize.classify.constantize.find(id) # Activity.find(1)
   end

end
