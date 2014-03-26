class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = Portfolio.all
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
   @portfolio = Portfolio.find(params[:id])
   
  end

  # GET /portfolios/new
  def new
   @portfolio = Portfolio.new
   @portfolios = Portfolio.order("title ASC")
   @departments = Department.order("name ASC")
   @portfolio_types = Portfolio::PORTFOLIO_TYPES
   @issues = Issue.order("title ASC")
  end

  # GET /portfolios/1/edit
  def edit
   @portfolio = Portfolio.find(params[:id])
   @departments = Department.order("name ASC")
   @portfolios = Portfolio.order("title ASC")
   @issues = Issue.order("title ASC")
   @portfolio_types = Portfolio::PORTFOLIO_TYPES
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
   @portfolio = Portfolio.new(portfolio_params)
   if @portfolio.save
    cart = RankCart.create(portfolio_id: @portfolio.id)
    cart.populate_rank_criteria(@portfolio.id, cart.id)
    flash[:success] = "PPA created successfully."
    redirect_to(:action => 'index')
   else
    @departments = Department.order("name ASC")
    @portfolios = Portfolio.order("title ASC")
    @issues = Issue.order("title ASC")
    @portfolio_types = Portfolio::PORTFOLIO_TYPES
    render('new')
   end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
   @portfolio = Portfolio.find(params[:id])
   if @portfolio.update_attributes(portfolio_params)
    flash[:success] = "PPA updated successfully."
    redirect_to(:action => 'index')
   else
    @departments = Department.order("name ASC")
    @portfolios = Portfolio.order("title ASC")
    @issues = Issue.order("title ASC")
    @portfolio_types = Portfolio::PORTFOLIO_TYPES
    render('edit')
   end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    portfolio = Portfolio.find(params[:id]).destroy
    flash[:success] = "#{portfolio.title} destroyed successfully."
    redirect_to(:action => 'index')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
     @portfolio_type = ["Program", "Project", "Activity"]
     @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:portfolio_id, :portfolio_type, :issue_id, :source_id, :department_id, :title, :description, :performance_indicator, :target, :amount, :start, :completion, :visible, :is_risky, :not_in_line, :not_related, :not_pest)
    end
end
