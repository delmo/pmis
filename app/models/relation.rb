class Relation < ActiveRecord::Base
 belongs_to :user
 belongs_to :linkable, polymorphic: true
 validates_presence_of :title, :description, :justification
end
