#################################################################
#Scoring controller for ranking of program, project and activity
################################################################
class RankCriteriaController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 before_action :set_rank_criterium, only: [:show, :edit, :update, :destroy]
 #before_action :check_weight, only: [:create, :update]
 after_action :verify_authorized, except:  [:index, :show]

  def index
    @rank_criteria = RankCriterium.all
  end

  def show
  end

  def new
    @rank_criterium = RankCriterium.new
    authorize @rank_criterium
  end

  def edit
    authorize @rank_criterium
  end

  def create
    @rank_criterium = RankCriterium.new(rank_criterium_params)
    authorize @rank_criterium
    @rank_criterium.user = current_user
     if @rank_criterium.save
       redirect_to @rank_criterium, notice: 'Rank criterium was successfully created.' 
       render action: 'show', status: :created, location: @rank_criterium 
     else
       render action: 'new' 
     end
  end

  def update
    authorize @rank_criterium
     if @rank_criterium.update(rank_criterium_params)
       redirect_to @rank_criterium, notice: 'Rank criterium was successfully updated.' 
     else
       render action: 'edit' 
     end
  end

  def destroy
    authorize @rank_criterium
    @rank_criterium.destroy
    flash[:success] = "Criterium destroyed successfully."
    redirect_to rank_criteria_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rank_criterium
      @rank_criterium = RankCriterium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rank_criterium_params
      params.require(:rank_criterium).permit(:criteria, :description, :weight)
    end

    def check_weight
     if @rank_criterium.weight.to_f > RankCriterium.check_free
      flash[:alert] = "Creation denied. The maximum weight you can put is #{RankCriterium.check_free}."
     end
    end
end
