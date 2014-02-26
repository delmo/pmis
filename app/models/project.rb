class Project < ActiveRecord::Base
 belongs_to :program
 has_many :activities
 belongs_to :issue
 has_many :risks, as: :riskiness, dependent: :destroy
 has_many :in_lines, as: :achievable, dependent: :destroy
 has_many :pests, as: :feasible, dependent: :destroy
 has_many :relations, as: :linkable, dependent: :destroy
 has_many :portfolio_implements

 validates :title, :description, :performance_indicator,
           :target, :presence => true

 validates :amount, :presence => true, numericality: { only_integer: true }
end
