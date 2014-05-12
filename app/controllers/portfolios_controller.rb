#########################################################
# Controller for accessing Program, Project and Activity
# ######################################################
#
class PortfoliosController < ApplicationController
 before_filter :authenticate_user!, except: [:current, :current_show, :index, :show]
 before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
 after_action :verify_authorized, :except => [:current, :report, :index, :show, :appeal, :submit_appeal, :calendar, :calendar_show, :current_show]


 # Show list of current portfolio this year
  def current
   if params[:year]
    @portfolios = Portfolio.search_portfolio(params[:year]).page(params[:page]).per(10)
   elsif params[:search]
    @portfolios = Portfolio.approved_search(params[:search]).page(params[:page]).per(10)
   else
    @portfolios = Portfolio.all_approved_portfolio
   end
   @years = Portfolio.years
  end

  # show individual portfolio this year
  def current_show
   @portfolio = Portfolio.find(params[:id])
  end

  # Portfolio of projects that needs reporting
  def report
   @ppas = Portfolio.report_search(params[:search]).page(params[:page]).per(10)
  end

  # list of project for next calendar year
  def index
   #ppas = Portfolio.search(params[:search])
   @portfolios = Portfolio.next_year_search(params[:search]).page(params[:page]).per(10)
  end

  # show individual project for next year
  def show
   @portfolio = Portfolio.find(params[:id])
  end

  # show project in calendar mode
  def calendar_show
   @portfolio = Portfolio.find(params[:id])
  end

  # create new project
  def new
   @portfolio = Portfolio.new
   authorize @portfolio
   @portfolios = Portfolio.order("title ASC")
   @departments = Department.order("name ASC")
   @portfolio_types = Portfolio::PORTFOLIO_TYPES
   @issues = Issue.order("title ASC")
  end

  # edit existing project
  def edit
   @portfolio = Portfolio.find(params[:id])
   authorize @portfolio
   @departments = Department.order("name ASC")
   @portfolios = Portfolio.order("title ASC")
   @issues = Issue.order("title ASC")
   @portfolio_types = Portfolio::PORTFOLIO_TYPES
  end

  # save new project
  def create
   @portfolio = Portfolio.new(portfolio_params)
   authorize @portfolio
   @portfolio.user = current_user
   if @portfolio.save
    cart = RankCart.create(portfolio_id: @portfolio.id)
    cart.populate_rank_criteria(@portfolio.id, cart.id)
    cart.user = current_user
    cart.save
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

  # update existing project
  def update
   @portfolio = Portfolio.find(params[:id])
   authorize @portfolio # policy for update
   if @portfolio.update_attributes(portfolio_params)
    flash[:success] = "PPA updated successfully."
    #redirect_to(:action => 'index')
    redirect_to(:back)
   else
    @departments = Department.order("name ASC")
    @portfolios = Portfolio.order("title ASC")
    @issues = Issue.order("title ASC")
    @portfolio_types = Portfolio::PORTFOLIO_TYPES
    render('edit')
   end
  end

  # delete existing record of a project
  def destroy
   authorize @portfolio # policy for delete
    portfolio = Portfolio.find(params[:id]).destroy
    flash[:success] = "#{portfolio.title} destroyed successfully."
    redirect_to(:action => 'index')
  end

  # projects on appeal
  def appeal
   @portfolios = Portfolio.next_year_portfolio.where("is_risky = true or not_in_line = true or not_related = true or not_pest = true").where("appeal = false")
  end

  # projects on review
  def review
   @portfolios = Portfolio.next_year_portfolio.where("appeal = true")
   authorize @portfolios
  end

  # submit a project on appeal
  def submit_appeal
   @portfolio = Portfolio.find(params[:id])
  end

  # submit decision to the project on appeal
  def decision
   @portfolio = Portfolio.find(params[:id])
   authorize @portfolio
  end

  # show portfolio in the calendar
  def calendar
   @ppas = Portfolio.where("approved = true")
   @ppas_by_date = @ppas.group_by(&:start)
   @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
     @portfolio_type = ["Program", "Project", "Activity"]
     @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:portfolio_id, :portfolio_type, :issue_id, :source_id, :department_id, :title, :description, :performance_indicator, :target, :amount, :start, :completion, :visible, :is_risky, :not_in_line, :not_related, :not_pest, :appeal, :decision)
    end
end
