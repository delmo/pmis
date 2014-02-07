class CreateReports < ActiveRecord::Migration
  def up
    create_table :reports do |t|
     t.integer "portfolio_implement_id"
     t.string "title"
     t.text "description"

     t.timestamps
    end
    add_index("reports", "portfolio_implement_id")
  end

  def down
   drop_table :reports
  end

end
