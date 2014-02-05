class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.integer "city_id"
      t.string "name"
      t.text "description"
      t.text "goal"
      t.text "development_thrust"
      t.text "objective"
      t.text "desired_outcome"
      t.text "required_policy"

      t.timestamps
    end
    add_index("sectors", "city_id")
  end
end
