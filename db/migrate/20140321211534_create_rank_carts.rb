class CreateRankCarts < ActiveRecord::Migration
  def change
    create_table :rank_carts do |t|

      t.timestamps
    end
  end
end
