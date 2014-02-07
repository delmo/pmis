class Issue < ActiveRecord::Base
 has_many :programs
 has_many :projects
 has_many :activities
end
