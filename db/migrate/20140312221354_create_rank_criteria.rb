class CreateRankCriteria < ActiveRecord::Migration
  def change
    create_table :rank_criteria do |t|
      t.string :criteria
      t.text :description
      t.decimal :weight, precision: 5, scale: 4

      t.timestamps
    end
  end
end
