class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :title
      t.text :description
      t.text :justification
      t.references :linkable, polymorphic: true

      t.timestamps
    end
    add_index :relations, [:linkable_id, :linkable_type]
  end
end
