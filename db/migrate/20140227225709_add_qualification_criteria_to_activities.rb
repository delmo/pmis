class AddQualificationCriteriaToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :is_risky, :boolean
    add_column :activities, :not_in_line, :boolean
    add_column :activities, :not_related, :boolean
    add_column :activities, :not_pest, :boolean
  end
end
