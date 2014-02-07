class PorfolioImplement < ActiveRecord::Base
 belongs_to :department
 belongs_to :program
 belongs_to :project
 belongs_to :activity
 has_many :reports
end
