class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.integer "program_id"
      t.integer "project_id"
      t.integer "activity_id"
      t.string "title"
      t.text "description"
      t.string "category"
      t.text "probability"
      t.text "severity"
      t.text "mitigation"

      t.timestamps
    end
    add_index("risks", "program_id")
    add_index("risks", "project_id")
    add_index("risks", "activity_id")
  end
end
