class Activity < ActiveRecord::Base
 belongs_to :issue
 has_many :risks
 belongs_to :project
 has_many :portfolio_implements

 validates :title, :description, :performance_indicator,
           :target, :presence => true

 validates :amount, :presence => true, numericality: { only_integer: true }

end
