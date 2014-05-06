class SelectionsController < ApplicationController
 before_filter :authenticate_user!, except: [:index]
 before_action :load_ppa
 after_action :verify_authorized, except:  [:index, :finalist, :evaluate]

  def index
  end

  def finalist
   budget_needed
  end

  def select
   @ppa = Portfolio.find(params[:id])
   authorize @ppa
   if @ppa.update_attribute(:approved, true)
    flash[:success] = "#{@ppa.title} is added to the final portfolio."
    redirect_to controller: :selections, action: :finalist
   end
  end

  def unselect
   @ppa = Portfolio.find(params[:id])
   authorize @ppa
   if @ppa.update_attribute(:approved, false)
    flash[:success] = "#{@ppa.title} is removed from the final portfolio."
    redirect_to controller: :selections, action: :finalist
   end
  end

  def general
   @counter = 0
   authorize @ppas
   @ppas.each { |p| 
    if p.sector.name == "General Public"
     @counter += 1
    end
   }
  end

  def social
   @counter = 0
   authorize @ppas
   @ppas.each { |p| 
    if p.sector.name == "Social Services"
     @counter += 1
    end
   }
  end

  def economic
   @counter = 0
   authorize @ppas
   @ppas.each { |p| 
    if p.sector.name == "Economic Services"
     @counter += 1
    end
   }
  end

  def other
   @counter = 0
   authorize @ppas
   @ppas.each { |p| 
    if p.sector.name == "Other Services"
     @counter += 1
    end
   }
  end

  def evaluate
   @criteria = RankCriterium.all
   flash[:notice] = "It has been evaluated."
   redirect_to :back
  end
  
  private

  def load_ppa
   @ppas = Portfolio.next_year_portfolio.where(is_risky: :false, not_in_line: :false, 
                             not_related: :false, not_pest: :false).sort_by {|p| p.rank_cart.total_score}.reverse
   @sectors = Sector.all
  end

  def portfolio_params
    params.require(:portfolio).permit(:portfolio_id, :approved)
  end

  def budget_needed
   @total_amount = Portfolio.approved_next_year_portfolio.sum(:amount)
  end
end
