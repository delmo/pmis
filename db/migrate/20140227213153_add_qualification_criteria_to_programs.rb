class AddQualificationCriteriaToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :is_risky, :boolean
    add_column :programs, :not_in_line, :boolean
    add_column :programs, :not_related, :boolean
    add_column :programs, :not_pest, :boolean
  end
end
