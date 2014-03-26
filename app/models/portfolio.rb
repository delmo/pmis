class Portfolio < ActiveRecord::Base
 PORTFOLIO_TYPES = ["Program", "Project", "Activity"]
 belongs_to :issue
 belongs_to :source
 belongs_to :department

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

 def sector
  department.sector
 end

end
