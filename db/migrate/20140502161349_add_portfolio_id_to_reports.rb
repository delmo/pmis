class AddPortfolioIdToReports < ActiveRecord::Migration
  def up
   remove_column :reports, :portfolio_implement_id
   add_column :reports, :portfolio_id, :integer
   add_index("reports", "portfolio_id")
  end

  def down
   remove_column :reports, :portfolio_id
   add_column :reports, :portfolio_implement_id, :integer
   add_index("reports", "portfolio_implement_id")
  end

end
