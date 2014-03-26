class AddPortfolioReferencesToRankCarts < ActiveRecord::Migration
  def up
   change_table :rank_carts do |t|
    t.references :portfolio
   end
   add_index :rank_carts, :portfolio_id, unique: true
  end

  def down
   remove_column :rank_carts, :portfolio_id
  end

end
