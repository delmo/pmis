class SchedulesController < ApplicationController
  def index
   @ppas = Portfolio.all.where("approved = true")
  end
end
