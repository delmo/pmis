class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string "name"
      t.string "address"
      t.string "postcode"
      t.string "telephone"
      t.string "website"
      t.string "email"
      t.text "vision"
      t.text "mission"
      t.text "development_thrust"

      t.timestamps
    end
  end
end
