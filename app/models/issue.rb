class Issue < ActiveRecord::Base
 belongs_to :user
 belongs_to :department
 has_many :programs
 has_many :projects
 has_many :activities

 validates :title, :implication, :intervention, :presence => true
end
