class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.column "firt_name", :string, :limit => 25
      t.column "last_name", :string, :limit => 50
      t.timestamps
    end
  end

  def down
   drop_table :users
  end

end
