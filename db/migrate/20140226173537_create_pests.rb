class CreatePests < ActiveRecord::Migration
  def change
    create_table :pests do |t|
      t.string :title
      t.text :description
      t.text :justification
      t.references :feasible, polymorphic: true

      t.timestamps
    end
    add_index :pests, [:feasible_id, :feasible_type]
  end
end
