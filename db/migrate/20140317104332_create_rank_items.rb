class CreateRankItems < ActiveRecord::Migration
  def change
    create_table :rank_items do |t|
      t.references :portfolio
      t.references :rank_criteria
      t.integer :rank_score, default: 0
      t.decimal :sub_total, precision: 5, scale: 4

      t.timestamps
    end
  end
end
