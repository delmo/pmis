class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer "department_id"
      t.string "title"
      t.text "implication"
      t.text "intervention"

      t.timestamps
    end
    add_index("issues", "department_id")
  end
end
