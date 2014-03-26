class RenameSubTotalToWeightInRankItems < ActiveRecord::Migration
  def up
   rename_column :rank_items, :sub_total, :weight
  end

  def down
   rename_column :rank_items, :weight, :sub_total
  end

end
