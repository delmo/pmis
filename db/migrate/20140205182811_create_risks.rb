class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.string "title"
      t.text "description"
      t.string "category"
      t.text "probability"
      t.text "severity"
      t.text "mitigation"

      t.timestamps
    end
  end
end
