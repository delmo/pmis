class ReportsController < ApplicationController
 before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
   @ppa = Portfolio.find(params[:portfolio_id])
   @reports = Report.where("portfolio_id = ?", params[:portfolio_id])
  end

  def show
  end

  def new
   @ppa = Portfolio.find(params[:portfolio_id])
   if @ppa
    @report = @ppa.reports.new
   end
  end

  def create
   @ppa = Portfolio.find(params[:portfolio_id])
   @report = Report.new(report_params)
   if @report.save
    redirect_to portfolio_reports_path(@ppa), notice: "Report was successfully created."
   else
    render action: 'new'
   end
  end

  def edit
  end

  def update
   if @report.update(report_params)
    redirect_to portfolio_reports_path(@ppa), notice: "Report was successfully updated."
   else
    render action: 'edit'
   end
  end

  def delete
  end

  def destroy
   @report.destroy
   redirect_to portfolio_reports_path(@ppa)
  end


  private

   def set_report
    @ppa = Portfolio.find(params[:portfolio_id])
    @report = Report.find(params[:id])
   end

   def report_params
    params.require(:report).permit(:title, :description, :portfolio_id, :photo)
   end

end
