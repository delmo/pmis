class City < ActiveRecord::Base
 has_many :sectors
 validates_presence_of :name
end
