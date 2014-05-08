class MonitorsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 after_action :verify_authorized, :except => [:general]

  def email_manager
   @ppa = Portfolio.find(params[:id])
   authorize @ppa
   @url = request.referer 
   ReportMailer.project_notification(@ppa.user, @ppa, @url).deliver
   flash[:success] = "Notification sent successfully."
   redirect_to monitors_ongoing_path
  end

  def general
   @status = {"completed" => Portfolio.completed.count, "on-time" => Portfolio.on_time.count, "late" => Portfolio.late.count}
  end

  def ongoing
   @ppas = Portfolio.current_portfolio
   authorize @ppas
  end

end
