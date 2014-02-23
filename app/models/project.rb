class Project < ActiveRecord::Base
 belongs_to :program
 has_many :activities
 belongs_to :issue
 has_many :risks, as: :riskiness, dependent: :destroy
 has_many :portfolio_implements

 validates :title, :description, :performance_indicator,
           :target, :presence => true

 validates :amount, :presence => true, numericality: { only_integer: true }
end
