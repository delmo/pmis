class Department < ActiveRecord::Base
 belongs_to :sector
 has_many :portfolio_implements
 has_many :issues

 validates :name, uniqueness: true 
 
 validates :name, :description, presence: true

 validates :email, presence: true, email: true
 
 validates :telephone, presence: true, format: { with: /\d{2,3}-\d{3}-\d{4}/, 
           message: "bad format, example: 043-284-9999" }
end

