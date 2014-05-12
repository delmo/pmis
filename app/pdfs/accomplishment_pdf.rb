# Generate pdf
# using Prawn
# Below aare details of how to draw
# 
class AccomplishmentPdf < Prawn::Document

 def initialize(city, ppa, reports, locations)
  super(top_margin: 20, page_size: 'LEGAL')
  @city = city
  @ppa = ppa
  @reports = reports
  @locations = locations
  header
  project_description
  project_locations
  report_tables
 end

 def header
  text "Municipality of #{@city.name}", :align => :center, :size => 12
  move_down 10
  text "ACCOMPLISHMENT REPORT", :align => :center, :size => 12
  move_down 10
  text "#{@ppa.portfolio_type} : #{@ppa.title}", :align => :center, :style => :bold
 end

 def project_description
  move_down 70
  text "#{@ppa.portfolio_type} description:", :style => :bold
  move_down 10
  text "#{@ppa.description}"
 end

 def project_locations
  move_down 30
  text "Location:", :style => :bold
  move_down 10
  if @locations.count > 0
   text "#{@locations.first.address}"
   move_down 5
  end
 end

 def report_section
  move_down 30
  text "Status:", :style => :bold
  move_down 5
  text "This #{@ppa.portfolio_type} is #{@ppa.status}."
  move_down 30
  text "Report:", :style => :bold
  move_down 5
  table report_rows do
   column(0).width = 200
   row(0).font_style = :bold
   row(0).align = :center
   self.row_colors = ["DDDDDD", "FFFFFF"]
   self.header = true
  end
 end

 def report_rows
  [["Title", "Report"]] +
   @reports.map do |report|
    [report.title, report.description]
   end
 end

 def report_tables
  move_down 30
  text "Status:", :style => :bold
  move_down 5
  text "This #{@ppa.portfolio_type} is #{@ppa.status}."
  counter = 0
   @reports.map do |report|
    move_down 10 
    text "<b>(#{counter += 1}.) Report title:</b> #{report.title}", :inline_format => true
    move_down 5 
    text "<b>Report description:</b> #{report.description}", :inline_format => true
    if report.photo_file_name 
     move_down 5 
     text "<b>Image:</b>", :inline_format => true
     image "#{Rails.root}/public/assets/reports/#{report.id}/medium/#{report.photo_file_name}"
    end
    move_down 10 
   end
 end


 def process_image
  #image "http://maps.google.com/maps/api/staticmap?size=600x300&sensor=false&zoom=12&markers=#{@locations.first.latitude}%2C#{@locations.first.longitude}"
  move_down 5
  image "#{Rails.root}/public/assets/reports/3/medium/premier-philippines.jpg"
 end

end
