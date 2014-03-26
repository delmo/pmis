class ChangeRankType < ActiveRecord::Migration
  def up
   change_column :activities, :rank, :decimal, { precision: 6, scale: 4}
   change_column :projects, :rank, :decimal, { precision: 6, scale: 4}
   change_column :programs, :rank, :decimal, { precision: 6, scale: 4}
  end

  def down
   change_column :programs, :rank, :integer
   change_column :projects, :rank, :integer
   change_column :activities, :rank, :integer
  end
end
