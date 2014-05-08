class RisksPdf < Prawn::Document

 def initialize(city, ppa, risks, view)
  super(top_margin: 20, page_layout: :landscape, page_size: 'LEGAL')
  @city = city
  @ppa = ppa
  @risks = risks
  @view = view
  header
  project_details
  analysis_matrix
 end

 def header
  text "Municipality of #{@city.name}", :align => :center, :size => 12
  text "RISK ANALYSIS", :align => :center, :size => 12
 end

 def project_details
  move_down 30
  text "<b>#{@ppa.portfolio_type} title:</b> #{@ppa.title}", :inline_format => true 
  move_down 10 
  text "Description:", :style => :bold, :size => 12
  text "#{@ppa.description}" 
  move_down 10 
  text "<b>Required budget:</b> #{amount(@ppa.amount)}", :inline_format => true
 end


 def analysis_matrix
  move_down 30
  table risk_rows do
   column(0).width = 100
   column(2).width = 100
   row(0).font_style = :bold
   row(0).align = :center
   self.row_colors = ["DDDDDD", "FFFFFF"]
   self.header = true
  end
 end

 def risk_rows
  [["TITLE", "DESCRIPTION", "CATEGORY", "PROBABILITY", "SEVERITY", "MITIGATION"]] +
   @risks.map do |risk|
    [risk.title, risk.description, risk.category, risk.probability, risk.severity, risk.mitigation]
   end
 end

 def amount(num)
  @view.number_to_currency(num, unit: 'Php ')
 end
end
