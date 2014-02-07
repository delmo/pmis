class Project < ActiveRecord::Base
 belongs_to :program
 has_many :activities
 belongs_to :issue
 has_many :risks
 has_many :portfolio_implements
end
