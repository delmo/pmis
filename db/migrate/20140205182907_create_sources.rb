class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string "name"
      t.text "description"
      t.decimal "amount", :precision => 16, :scale => 2 
      t.date "budget_year"

      t.timestamps
    end
  end

  def down
   drop_table :sources
  end
end
