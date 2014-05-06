class RankItem < ActiveRecord::Base
 belongs_to :user
 belongs_to :rank_cart
 belongs_to :portfolio
 belongs_to :rank_criterium

 def sub_total
  rank_criterium.weight * rank_score
 end

end
