class CreatePrograms < ActiveRecord::Migration
  def up
    create_table :programs do |t|
      t.integer "issue_id"
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
    add_index("programs", "issue_id")
    add_index("programs", "user_id")
    add_index("programs", "source_id")
  end

  def down
   drop_table :programs
  end
end
