class AddDepartmentReferenceToActivity < ActiveRecord::Migration
  def up
   remove_index :activities, column: :user_id
   remove_column :activities, :user_id
   add_column :activities, :department_id, :integer
   add_index :activities, :department_id
  end

  def down
   remove_index :activities, column: :department_id
   remove_column :activities, :department_id
   add_column :activities, :user_id, :integer
   add_index :activities, :user_id
  end
end
