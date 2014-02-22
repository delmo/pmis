class ChangeUsernameToUsers < ActiveRecord::Migration
  def up
   change_column :users, :username, :string, { limit: 25, :default => "" }
   add_index :users, :username, :unique => true
  end

  def down
   change_column :users, :username, :string
   remove_index :users, column: :username
  end

end
