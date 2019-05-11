class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :item_name
      t.integer :item_price

      t.timestamps
    end
  end
end
