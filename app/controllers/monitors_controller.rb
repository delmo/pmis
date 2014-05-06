class MonitorsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 after_action :verify_authorized, :except => [:general]

  def general
   @status = {"completed" => Portfolio.completed.count, "on-time" => Portfolio.on_time.count, "late" => Portfolio.late.count}
  end

  def ongoing
   @ppas = Portfolio.current_portfolio
   authorize @ppas
  end

end
