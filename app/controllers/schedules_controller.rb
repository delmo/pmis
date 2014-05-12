####################
#Controller for scheduling a project
###################
#
class SchedulesController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
  def index
   @ppas = Portfolio.approved_next_year_portfolio
   #@ppas = Portfolio.all.where("approved = true")
  end
end
