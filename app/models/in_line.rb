class InLine < ActiveRecord::Base
 belongs_to :achievable, polymorphic: true
 validates_presence_of :title, :description, :justification
end
