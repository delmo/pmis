class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string "name"
      t.decimal "personal_service", :precision => 12, :scale => 2
      t.decimal "mooe", :precision => 12, :scale => 2
      t.decimal "capital_outlay", :precision => 12, :scale =>2
      t.decimal "total", :precision => 16, :scale => 2 
      t.date "implementation_year"

      t.timestamps
    end
  end
end
