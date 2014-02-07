class CreatePortfolioImplements < ActiveRecord::Migration
  def up
    create_table :portfolio_implements do |t|
      t.references :department
      t.references :program
      t.references :project
      t.references :activity
      t.date "start"
      t.date "completion"
      t.string "financial_status"
      t.string "work_status"
      t.string "note"

      t.timestamps
    end
    add_index("portfolio_implements", "department_id")
    add_index("portfolio_implements", "program_id")
    add_index("portfolio_implements", "project_id")
    add_index("portfolio_implements", "activity_id")
  end

  def down
   drop_table :portfolio_implements
  end
end
