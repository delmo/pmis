class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :portfolio_id

      t.timestamps
    end
    add_index("locations", "portfolio_id")
  end
end
