class RankCriterium < ActiveRecord::Base
 has_many :rank_items, dependent: :destroy
end
