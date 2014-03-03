class ChangeDescriptionToDepartments < ActiveRecord::Migration
  def up
   change_column :departments, :description, :text
  end

  def down
   change_column :departments, :description, :string
  end
end
