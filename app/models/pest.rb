class Pest < ActiveRecord::Base
 belongs_to :feasible, polymorphic: true
 validates_presence_of :title, :description, :justification
end
