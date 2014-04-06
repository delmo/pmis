class AddApproveToPortfolios < ActiveRecord::Migration
  def up
   add_column :portfolios, :approved, :boolean, default: false
  end

  def down
   remove_columm :portfolios, :approved
  end

end
