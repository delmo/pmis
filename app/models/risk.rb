class Risk < ActiveRecord::Base
 belongs_to :program
 belongs_to :project
 belongs_to :activity

 validates_presence_of :title, :description, :category, :probability, :severity, :mitigation
end
