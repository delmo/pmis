class Sector < ActiveRecord::Base
 belongs_to :user
 belongs_to :city
 has_many :departments

 validates :name, :description, :goal, :development_thrust, :objective, :desired_outcome, :required_policy, presence: true
end
