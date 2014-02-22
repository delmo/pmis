class RenameColumnFirtNameToUsers < ActiveRecord::Migration
  def change
   rename_column :users, :firt_name, :first_name
  end
end
