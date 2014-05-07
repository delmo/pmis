class ApiPdf < Prawn::Document
 

 def initialize(ppas, city, view)
  super(top_margin: 20, page_layout: :landscape, page_size: 'LEGAL')
  @ppas = ppas
  @city = city
  @view = view
  header
  analysis_matrix
 end


 def header
  text "Municipality of #{@city.name}", :align => :center, :size => 12
  text "ANNUAL INVESTMENT PLAN (AIP) #{Time.now.year+1} ", :align => :center, :size => 12
 end


 def analysis_matrix
  move_down 30
  table project_rows do
   column(0).width = 75
   columns(1..3).width = 100
   column(6).width = 110
   row(0).font_style = :bold
   columns(0..3).align = :center
   column(6).align = :right
   self.row_colors = ["DDDDDD", "FFFFFF"]
   header = true
   row(0).align = :center
  end
 end

 
 def project_rows
  [["PROGRAM /PROJECT /ACTIVITY", "DEPARTMENT", "START", "COMPLETION", "PERFORMANCE INDICATORS", "TARGETS", "AMOUNT"]] +
   @ppas.map do |ppa|
    [ppa.title, ppa.department.name, ppa.start, ppa.completion, ppa.performance_indicator, ppa.target, amount(ppa.amount)]  
   end
 end

 def amount(num)
  @view.number_to_currency(num, unit: 'Php ')
 end

end
