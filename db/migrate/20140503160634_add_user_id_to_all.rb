class AddUserIdToAll < ActiveRecord::Migration
  def up
   add_column :blogs, :user_id, :integer
   add_column :cities, :user_id, :integer
   add_column :departments, :user_id, :integer
   add_column :in_lines, :user_id, :integer
   add_column :issues, :user_id, :integer
   add_column :locations, :user_id, :integer
   add_column :pests, :user_id, :integer
   add_column :portfolios, :user_id, :integer
   add_column :rank_carts, :user_id, :integer
   add_column :rank_criteria, :user_id, :integer
   add_column :rank_items, :user_id, :integer
   add_column :relations, :user_id, :integer
   add_column :reports, :user_id, :integer
   add_column :risks, :user_id, :integer
   add_column :sectors, :user_id, :integer
   add_column :sources, :user_id, :integer
   add_column :tasks, :user_id, :integer
  end

  def down
   remove_column :blogs, :user_id
   remove_column :cities, :user_id
   remove_column :departments, :user_id
   remove_column :in_lines, :user_id
   remove_column :issues, :user_id
   remove_column :locations, :user_id
   remove_column :pests, :user_id
   remove_column :portfolios, :user_id
   remove_column :rank_carts, :user_id
   remove_column :rank_criteria, :user_id
   remove_column :rank_items, :user_id
   remove_column :relations, :user_id
   remove_column :reports, :user_id
   remove_column :risks, :user_id
   remove_column :sectors, :user_id
   remove_column :sources, :user_id
   remove_column :tasks, :user_id
  end
end
