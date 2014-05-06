class Portfolio < ActiveRecord::Base
 belongs_to :user
 PORTFOLIO_TYPES = ["Program", "Project", "Activity"]
 belongs_to :issue
 belongs_to :source
 belongs_to :department
 has_many :tasks, dependent: :destroy
 has_many :reports, dependent: :destroy
 has_many :locations, dependent: :destroy

 belongs_to :parent, :class_name => 'Portfolio', :foreign_key => 'portfolio_id'
 has_many :children, :class_name => 'Portfolio'

 has_one :rank_cart, dependent: :destroy

 has_many :risks, as: :riskiness, dependent: :destroy
 has_many :in_lines, as: :achievable, dependent: :destroy
 has_many :pests, as: :feasible, dependent: :destroy
 has_many :relations, as: :linkable, dependent: :destroy

 has_many :rank_items, dependent: :destroy

 validates :portfolio_type, inclusion: PORTFOLIO_TYPES
 validates :title, :description, :performance_indicator,
           :target, :amount,  presence: true
 validate :dates_must_make_sense

 def self.search(search)
  if search
   find(:all, conditions: ['title LIKE ?', "%#{search}%"])
  else
   find(:all)
  end
 end

 def self.approved_search(search)
  if search
   all_approved_portfolio.where('title LIKE ?', "%#{search}%")
  end
 end

 def self.report_search(search)
  if search
   current_portfolio.where('title LIKE ?', "%#{search}%")
  else
   current_portfolio
  end
 end

 def self.next_year_search(search)
  if search
   next_year_portfolio.where('title LIKE ?', "%#{search}%")
  else
   next_year_portfolio
  end
 end


 def sector
  department.sector
 end

 def status
  if start > Time.now
   "start soon"
  else
   if completion < Time.now and not_completed?
    "late"
   elsif completion <= Time.now and !not_completed?
    "completed"
   else
    "on-going"
   end
  end
 end


 # check if any of its tasks is not completed
 def not_completed?
  tasks.any? { |task| task.done != 100 }
 end
 
 #get projects that are on time
 scope :on_time, lambda { current_portfolio.where("start <= ? and completion >= ?", Time.now, Time.now) }

 #get projects that are late
 scope :late, lambda { current_portfolio.where("completion < ?", Time.now).find_all { |p| p.not_completed? == true} }

 #get completed projects
 scope :completed, lambda { current_portfolio.where("completion < ?", Time.now).find_all { |p| p.not_completed? == false} }
 
 #portfolio for this year
 scope :current_portfolio, lambda { where("EXTRACT(YEAR FROM start) = ?", Time.now.year).where("approved = ?", true)}

 #portfolio for next year
 scope :approved_next_year_portfolio, lambda { where("EXTRACT(YEAR FROM start) = ?", Time.now.year+1).where("approved = ?", true)}

 #portfolio for next year
 scope :next_year_portfolio, lambda { where("EXTRACT(YEAR FROM start) = ?", Time.now.year+1)}

 #search approved portfolio by year
 scope :search_portfolio, -> (year = Time.now.year) { where("EXTRACT(YEAR FROM start) = ?", year).where("approved = ?", true)}

 #return all approved portfolio
 scope :all_approved_portfolio, lambda { where("approved = ?", true)}

 def self.years
  arr = Portfolio.all.pluck(:start)
  out = []
  arr.each { |date| out << date.year unless out.include? date.year }
  out
 end

 private
 def dates_must_make_sense
  if completion <= start
   errors.add(:start, ' date has to be before the completion date')
  end
 end
end
