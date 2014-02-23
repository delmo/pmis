class AddRiskinessToRisks < ActiveRecord::Migration
  def change
   change_table :risks do |t|
    t.references :riskiness, polymorphic: true
   end
   add_index :risks, [:riskiness_id, :riskiness_type]
  end
end
