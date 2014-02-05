class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string "title"
      t.text "implication"
      t.text "intervention"

      t.timestamps
    end
  end
end
