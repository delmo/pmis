class AddDescisionAndAppealToPortfolio < ActiveRecord::Migration
  def up
   add_column :portfolios, :appeal, :boolean, default: false
   add_column :portfolios, :decision, :text 
  end

  def down
   remove_column :portfolios, :decision
   remove_column :portfolios, :appeal
  end
end
