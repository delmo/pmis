################################################
# Controller for editing multiple criteria
# #############################################
#
class RankCartsController < ApplicationController
 before_filter :authenticate_user!, except: [:show]
 before_action :set_rank_cart, only: [:show, :edit_multiple]
 after_action :verify_authorized, except:  [:show, :update_multiple]

 # show all rank criteria for a given project
  def show
   @portfolio = Portfolio.find_by(id: @rank_cart.portfolio_id)
   @sector = find_action(@portfolio)
   @rank_items = RankItem.where("rank_cart_id = #{@rank_cart.id}")
  end

  # edit all criteria for the given project
  def edit_multiple
   @portfolio = Portfolio.find_by(id: @rank_cart.portfolio_id)
   authorize @portfolio
   @sector = find_action(@portfolio)
   if params[:rank_item_ids].nil?
    redirect_to @rank_cart, alert: 'Please ensure to tick at least one category rank.' 
   else
    @rank_items = RankItem.find(params[:rank_item_ids])
   end
  end

  # update all criteria for the given project
  def update_multiple
   RankItem.update(params[:rank_items].keys, params[:rank_items].values)
   flash[:success] = "Score updated successfully."
   portfolio = Portfolio.find(params[:portfolio_id])
   selection_action = find_action(portfolio)
   redirect_to controller: :selections, action: selection_action
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rank_cart
      @rank_cart = RankCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rank_cart_params
      params[:rank_cart, :portfolio]
    end

    def find_action(portfolio)
     case portfolio.sector.name
     when "General Public"
      selection_action = "general"
     when "Social Services"
      selection_action =  "social"
     when "Economic Services"
      selection_action = "economic"
     when "Other Services"
      selection_action = "other"
     else
      selection_action = "index"
     end
    end
end
