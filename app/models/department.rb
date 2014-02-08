class Department < ActiveRecord::Base
 belongs_to :sector
 has_many :portfolio_implements
 has_many :issues
end
