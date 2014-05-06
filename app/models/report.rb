class Report < ActiveRecord::Base
 belongs_to :user
 belongs_to :portfolio

 validates :title, :description, presence: true

 has_attached_file :photo, :styles => { :medium => "300x300>",
                                        :thumb => "100x100>" },
                                        :url => "/assets/reports/:id/:style/:basename.:extension",
                                        :path => ":rails_root/public/assets/reports/:id/:style/:basename.:extension"

 validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
 validates_attachment_size :photo, :less_than => 5.megabytes

end
