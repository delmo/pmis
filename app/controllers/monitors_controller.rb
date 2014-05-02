class MonitorsController < ApplicationController
  def general
   @status = {"completed" => Portfolio.completed.count, "on-time" => Portfolio.on_time.count, "late" => Portfolio.late.count}
  end

  def ongoing
   @ppas = Portfolio.current_portfolio
  end

end
