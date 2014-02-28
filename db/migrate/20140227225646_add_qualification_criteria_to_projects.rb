class AddQualificationCriteriaToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_risky, :boolean
    add_column :projects, :not_in_line, :boolean
    add_column :projects, :not_related, :boolean
    add_column :projects, :not_pest, :boolean
  end
end
