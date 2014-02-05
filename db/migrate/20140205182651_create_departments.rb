class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer "sector_id"
      t.string "name"
      t.string "description"
      t.string "telephone"
      t.string "email"

      t.timestamps
    end
    add_index("departments", "sector_id")
  end
end
