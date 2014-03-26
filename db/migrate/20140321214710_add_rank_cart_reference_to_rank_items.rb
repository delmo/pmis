class AddRankCartReferenceToRankItems < ActiveRecord::Migration
  def up
   change_table :rank_items do |t|
    t.references :rank_cart
   end
   add_index :rank_items, :rank_cart_id
   add_index :rank_items, :portfolio_id
   add_index :rank_items, :rank_criteria_id
  end

  def down
   remove_index :rank_items, :rank_criteria_id
   remove_index :rank_items, :portfolio_id
   remove_index :rank_items, :rank_cart_id
   remove_column :rank_items, :rank_cart_id
  end

end
