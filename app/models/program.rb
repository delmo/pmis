class Program < ActiveRecord::Base
 has_many :projects
 belongs_to :issue
 has_many :risks
 has_many :portfolio_implements
end
