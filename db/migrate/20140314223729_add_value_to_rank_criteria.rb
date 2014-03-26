class AddValueToRankCriteria < ActiveRecord::Migration
  def up
   add_column :rank_criteria, :value, :integer, {default: 0, limit: 2}
  end

  def down
   remove_column :rank_criteria, :value
  end
end
