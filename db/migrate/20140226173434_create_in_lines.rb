class CreateInLines < ActiveRecord::Migration
  def change
    create_table :in_lines do |t|
      t.string :title
      t.text :description
      t.text :justification
      t.references :achievable, polymorphic: true

      t.timestamps
    end
    add_index :in_lines, [:achievable_id, :achievable_type]
  end
end
