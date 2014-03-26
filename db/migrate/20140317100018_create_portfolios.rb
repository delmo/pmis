class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.references :issue, index: true
      t.references :source, index: true
      t.references :department, index: true
      t.references :portfolio
      t.string :portfolio_type
      t.string :title
      t.text :description
      t.text :performance_indicator
      t.text :target
      t.decimal :amount, precision: 12, scale: 2
      t.date :start
      t.date :completion
      t.boolean :visible, default: false
      t.boolean :is_risky, default: false
      t.boolean :not_in_line, default: false
      t.boolean :not_related, default: false
      t.boolean :not_pest, default: false

      t.timestamps
    end
  end
end
