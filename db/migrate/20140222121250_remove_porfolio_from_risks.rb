class RemovePorfolioFromRisks < ActiveRecord::Migration
  def up
    remove_column :risks, :program_id, :integer
    remove_column :risks, :project_id, :integer
    remove_column :risks, :activity_id, :integer
  end

  def down
    add_column :risks, :program_id, :integer
    add_column :risks, :project_id, :integer
    add_column :risks, :activity_id, :integer
    add_index("risks", "program_id")
    add_index("risks", "project_id")
    add_index("risks", "activity_id")
  end
end
