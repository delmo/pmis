class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :due_date
      t.integer :done
      t.integer :portfolio_id

      t.timestamps
    end
  end
end
