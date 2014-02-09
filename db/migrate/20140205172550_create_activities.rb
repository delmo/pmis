class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer "issue_id"
      t.integer "project_id"
      t.integer "user_id"
      t.integer "source_id"
      t.string "title"
      t.text "description"
      t.text "performance_indicator"
      t.text "target"
      t.decimal "amount", :precision => 12, :scale => 2
      t.date "start"
      t.date "completion"
      t.integer "rank"
      t.boolean "visible", :default => false
      t.string "permalink"
   
      t.timestamps
    end
    add_index("activities", "issue_id")
    add_index("activities", "project_id")
    add_index("activities", "user_id")
    add_index("activities", "source_id")
  end

end
