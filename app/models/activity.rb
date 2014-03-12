class Activity < ActiveRecord::Base
 belongs_to :issue
 has_many :risks, as: :riskiness, dependent: :destroy
 has_many :in_lines, as: :achievable, dependent: :destroy
 has_many :pests, as: :feasible, dependent: :destroy
 has_many :relations, as: :linkable, dependent: :destroy
 belongs_to :project
 has_many :portfolio_implements
 belongs_to :user
 belongs_to :department

 validates :title, :description, :performance_indicator,
           :target, :presence => true

 validates :amount, :presence => true, numericality: { only_integer: true }

 def sector
  department.sector
 end

end
