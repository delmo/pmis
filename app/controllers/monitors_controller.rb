###############################################
#Controller for monitoring a project
##############################################
#
class MonitorsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]
 after_action :verify_authorized, :except => [:general]

 # Notify the manager of the project if
 # the implementation is late
  def email_manager
   @ppa = Portfolio.find(params[:id])
   authorize @ppa
   @url = request.referer 
   ReportMailer.project_notification(@ppa.user, @ppa, @url).deliver
   flash[:success] = "Notification sent successfully."
   redirect_to monitors_ongoing_path
  end

  # shows all completed projects 
  # on-time
  # and late
  def general
   @status = {"completed" => Portfolio.completed.count, "on-time" => Portfolio.on_time.count, "late" => Portfolio.late.count}
  end

 # show all ongoing projects
  def ongoing
   @ppas = Portfolio.current_portfolio
   authorize @ppas
  end

end
