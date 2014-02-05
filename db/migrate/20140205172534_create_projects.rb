class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer "program_id"
      t.integer "user_id"
      t.integer "department_id"
      t.integer "sector_id"
      t.integer "issue_id"
      t.integer "risk_id"
      t.integer "report_id"
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
    add_index("projects", "program_id")
    add_index("projects", "user_id")
    add_index("projects", "department_id")
    add_index("projects", "sector_id")
    add_index("projects", "issue_id")
    add_index("projects", "risk_id")
    add_index("projects", "report_id")
    add_index("projects", "source_id")
  end

end
