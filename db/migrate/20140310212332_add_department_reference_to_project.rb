class AddDepartmentReferenceToProject < ActiveRecord::Migration
  def up
   remove_index :projects, column: :user_id
   remove_column :projects, :user_id
   add_column :projects, :department_id, :integer
   add_index :projects, :department_id
  end

  def down
   remove_index :projects, column: :department_id
   remove_column :projects, :department_id
   add_column :projects, :user_id, :integer
   add_index :projects, :user_id
  end
end
