class RankCriterium < ActiveRecord::Base
 belongs_to :user
 has_many :rank_items, dependent: :destroy
end
