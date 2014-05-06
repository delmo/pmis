class Location < ActiveRecord::Base
 belongs_to :user
 belongs_to :portfolio

 geocoded_by :address
 reverse_geocoded_by :latitude, :longitude
 after_validation :geocode, :reverse_geocode,
  :if => lambda { |obj| obj.address_changed? }
end
