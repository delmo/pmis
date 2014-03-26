class RemoveValueColumnFromRankCriteria < ActiveRecord::Migration
  def up
   remove_column :rank_criteria, :value
  end

  def down
   add_column :rank_criteria, :value, :integer, {default: 0, limit: 2}
  end

end
