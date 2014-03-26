class SelectionsController < ApplicationController
 before_action :load_ppa

  def index
  end

  def general
   @counter = 0
   @ppas.each { |p| 
    if p.sector.name == "General Public"
     @counter += 1
    end
   }
  end

  def social
   @counter = 0
   @ppas.each { |p| 
    if p.sector.name == "Social Services"
     @counter += 1
    end
   }
  end

  def economic
   @counter = 0
   @ppas.each { |p| 
    if p.sector.name == "Economic Services"
     @counter += 1
    end
   }
  end

  def other
   @counter = 0
   @ppas.each { |p| 
    if p.sector.name == "Other Services"
     @counter += 1
    end
   }
  end

  def evaluate
   @criteria = RankCriterium.all

   flash[:notice] = "It has been evaluated."
   redirect_to :back
  end
  
  private

  def load_ppa
   @programs = Program.where(is_risky: :false, not_in_line: :false, 
                             not_related: :false, not_pest: :false)
   @projects = Project.where(is_risky: :false, not_in_line: :false,
                             not_related: :false, not_pest: :false)
   @activities = Activity.where(is_risky: :false, not_in_line: :false,
                             not_related: :false, not_pest: :false)
   # @ppas = @programs + @projects + @activities
   @ppas = Portfolio.where(is_risky: :false, not_in_line: :false, 
                             not_related: :false, not_pest: :false).sort_by {|p| p.rank_cart.total_score}.reverse
   @sectors = Sector.all
  end
end
