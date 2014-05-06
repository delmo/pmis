class Risk < ActiveRecord::Base
 belongs_to :user
 belongs_to :riskiness, polymorphic: true

 validates_presence_of :title, :description, :category, :probability, :severity, :mitigation
end
