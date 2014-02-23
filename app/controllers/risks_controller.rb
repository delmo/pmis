class RisksController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 before_filter :load_riskiness

  def index
   @risks = @riskiness.risks
  end

  def show
   @risk = Risk.find(params[:id])
  end

  def new
   @risk = @riskiness.risks.new
  end

  def create
   @risk = @riskiness.risks.new(risk_params)
   if @risk.save
    flash[:success] = "Risk created successfully."
    redirect_to [@riskiness, :risks]
   else
    render('new')
   end
  end

  def edit
   @risk = @riskiness.risks.find(params[:id])
  end

  def update
   @risk = @riskiness.risks.find(params[:id])
   if @risk.update_attributes(risk_params)
    flash[:success] = "Risk updated succesfully."
    redirect_to [@riskiness, :risks]
   else
    render('edit')
   end
  end

  def delete
   @risk = @riskiness.risks.find(params[:id])
  end


  def destroy
   risk = @riskiness.risks.find(params[:id]).destroy
   flash[:success] = "#{risk.title} destroyed successfully."
   redirect_to [@riskiness, :risks]
  end


  private
   def risk_params
    params.require(:risk).permit(:title, :description, :category, :probability, :severity, :mitigation)
   end

   def load_riskiness
    resource, id = request.path.split('/')[1,2]
    @riskiness = resource.singularize.classify.constantize.find(id) # Activity.find(1)
   end

   #def load_riskiness
   # klass = [Activity, Program, Project].detect { |r| params["#{r.name.underscore}_id"] }
   # @riskiness = klass.find(params["#{klass.name.underscore}_id"])
   #end

end
