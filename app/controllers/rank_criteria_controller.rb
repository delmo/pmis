class RankCriteriaController < ApplicationController
  before_action :set_rank_criterium, only: [:show, :edit, :update, :destroy]

  # GET /rank_criteria
  # GET /rank_criteria.json
  def index
    @rank_criteria = RankCriterium.all
  end

  # GET /rank_criteria/1
  # GET /rank_criteria/1.json
  def show
  end

  # GET /rank_criteria/new
  def new
    @rank_criterium = RankCriterium.new
  end

  # GET /rank_criteria/1/edit
  def edit
  end

  # POST /rank_criteria
  # POST /rank_criteria.json
  def create
    @rank_criterium = RankCriterium.new(rank_criterium_params)

    respond_to do |format|
      if @rank_criterium.save
        format.html { redirect_to @rank_criterium, notice: 'Rank criterium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rank_criterium }
      else
        format.html { render action: 'new' }
        format.json { render json: @rank_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rank_criteria/1
  # PATCH/PUT /rank_criteria/1.json
  def update
    respond_to do |format|
      if @rank_criterium.update(rank_criterium_params)
        format.html { redirect_to @rank_criterium, notice: 'Rank criterium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rank_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rank_criteria/1
  # DELETE /rank_criteria/1.json
  def destroy
    @rank_criterium.destroy
    respond_to do |format|
      format.html { redirect_to rank_criteria_url }
      format.json { head :no_content }
    end
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
end
