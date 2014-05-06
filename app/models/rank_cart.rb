class RankCart < ActiveRecord::Base
 belongs_to :user
 belongs_to :portfolio
 has_many :rank_items, dependent: :destroy

=begin

 def get_rank(portfolio_id)
  current_rank_items = rank_items.find_by(portfolio_id: portfolio_id)
  if current_rank_items
   # do nothing
  else
   current_rank_items = []
   new_rank_cart = rank_carts.new
   RankCriterium.all.each do |c|
    current_rank_items << RankItem.new(portfolio_id: portfolio_id, 
                                       rank_cart_id: new_rank_cart.id,
                                       rank_criteria_id: c.id)
   end
  end
  current_rank_items
 end

 def add_rank_criteria(rank_criterium_id)
  current_rank_item = rank_items.find_by(rank_criterium_id: rank_criterium_id)
  if current_rank_item
   # do nothing
  else
   current_rank_item = line_items.build(rank_criterium_id: rank_criterium_id)
   current_rank_item.weight = current_rank_item.rank_criterium.weight
  end
  current_rank_item
 end

=end

 def total_score
  rank_items.to_a.sum { |item| item.rank_score * item.weight }
 end

 def populate_rank_criteria(portfolio_id, rank_cart_id)
  
  columns = [:portfolio_id, :rank_criterium_id, :rank_score, :weight, :rank_cart_id]
  values = []

  RankCriterium.all.each do |criteria|
   values << [portfolio_id, criteria.id, 0, criteria.weight, rank_cart_id]
  end

  RankItem.import(columns, values, validate: false)
 end

end
