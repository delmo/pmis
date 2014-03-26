class RenameCriteriaColumnInRankItems < ActiveRecord::Migration
  def up
   rename_column :rank_items, :rank_criteria_id, :rank_criterium_id
  end

  def down
   rename_column :rank_items, :rank_criterium_id, :rank_criteria_id
  end
end
