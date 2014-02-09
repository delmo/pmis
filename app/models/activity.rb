class Activity < ActiveRecord::Base
 belongs_to :issue
 has_many :risks
 belongs_to :project
 has_many :portfolio_implements
end
