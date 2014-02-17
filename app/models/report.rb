class Report < ActiveRecord::Base
 belongs_to :portfolio_implement

 validates :title, :description, presence: true
end
