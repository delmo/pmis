# print pdf copy of issues
#
#
#
#
class IssuesPdf < Prawn::Document

 def initialize(city, issues)
  super(top_margin: 20, page_layout: :landscape, page_size: 'LEGAL')
  @city = city
  @issues = issues

  header
  analysis_matrix
 end

 def header
  text "Municipality of #{@city.name}", :align => :center, :size => 12
  text "ANALYSIS MATRIX", :align => :center, :size => 12
 end

 def analysis_matrix
  move_down 30
  table issue_rows do
   #rows(1..3).width = 72
   row(0).font_style = :bold
   row(0).align = :center
   self.row_colors = ["DDDDDD", "FFFFFF"]
   self.header = true
  end
 end

 def issue_rows
  [["ISSUES/CONCERNS/OBSERVATIONS/TECHNICAL FINDINGS", "IMPLICATIONS/EFFECTS", "POLICY OPTIONS/INTERVENTIONS/POSSIBLE SOLUTIONS"]] +
   @issues.map do |issue|
    [issue.title, issue.implication, issue.intervention]
   end
 end

end
