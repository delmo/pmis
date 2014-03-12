class AddDepartmentReferenceToProgram < ActiveRecord::Migration
  def up
   remove_index :programs, column: :user_id
   remove_column :programs, :user_id
   add_column :programs, :department_id, :integer
   add_index :programs, :department_id
  end

  def down
   remove_index :programs, column: :department_id
   remove_column :programs, :department_id
   add_column :programs, :user_id, :integer
   add_index :programs, :user_id
  end

end
