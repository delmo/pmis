class RankCriterium < ActiveRecord::Base
 belongs_to :user
 has_many :rank_items, dependent: :destroy

 def self.max_total_reached?
  if self.sum(:weight) < 1.00
   false
  else
   true
  end
 end
 
 def self.check_free
  1.00 - self.sum(:weight)
 end
end
