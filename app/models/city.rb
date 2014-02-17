class City < ActiveRecord::Base
 has_many :sectors
 validates :name, :postcode, :vision, :mission, :development_thrust,  presence: true

 validates :email, presence: true, email: true

 validates :website, presence: true, url: true 
 
 validates :telephone, presence: true, format: { with: /\d{2,3}-\d{3}-\d{4}/, 
           message: "bad format, example: 043-284-9999" }
end
