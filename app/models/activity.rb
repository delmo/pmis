class Activity < ActiveRecord::Base
 belongs_to :projects
 belongs_to :issue
 has_many :risks
 has_many :portfolio_implements
end
