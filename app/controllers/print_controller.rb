class PrintController < ApplicationController
 after_action :verify_authorized, :except => [:risks, :issues, :aip, :accomplishment]
 before_action :load_data, :only => [:issues, :aip]

 def risks
  @ppa = Portfolio.find(params[:id])
  @city = City.first
  @risks = @ppa.risks
   respond_to do |format|
    format.html
    format.pdf do
     pdf = RisksPdf.new(@city, @ppa,  @risks, view_context) 
     send_data pdf.render, filename: "risks.pdf",
      type: "application/pdf",
      disposition: "inline"
    end
   end
 end

  def issues
   respond_to do |format|
    format.html
    format.pdf do
     pdf = IssuesPdf.new(@city, @issues) 
     send_data pdf.render, filename: "issues.pdf",
      type: "application/pdf",
      disposition: "inline"
    end
   end
  end

  def aip
   respond_to do |format|
    format.html
    format.pdf do
     pdf = Prawn::Document.new
     pdf = ApiPdf.new(@ppas, @city, view_context) 
     send_data pdf.render, filename: "aip.pdf",
      type: "application/pdf",
      disposition: "inline"
    end
   end
  end

  def accomplishment
   @city = City.first
   @ppa = Portfolio.find(params[:id])
   @reports = @ppa.reports
   @locations = @ppa.locations
   respond_to do |format|
    format.html
    format.pdf do
     pdf = Prawn::Document.new
     pdf = AccomplishmentPdf.new(@city, @ppa, @reports, @locations) 
     #pdf.image(open(ActionController::Base.helpers.image_tag(@reports.first.photo.url(:medium))))
     #pdf.image("#{Rails.root}/public/assets/reports/3/medium/premier-philippines.jpg")
    #pdf.image(open(URI.escape("http://maps.google.com/maps/api/staticmap?size=600x300&sensor=false&zoom=12&markers=#{@locations.first.latitude}%2C#{@locations.first.longitude}")))
     send_data pdf.render, filename: "accomplishment.pdf",
      type: "application/pdf",
      disposition: "inline"
    end
   end
 end

  private

   def load_data
    @city = City.first
    @issues = Issue.where("EXTRACT(YEAR FROM updated_at) = ?", Time.now.year)
    @ppas = Portfolio.approved_next_year_portfolio
   end
end
