class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, limit: 80
      t.text :detail, null: false
      t.integer :price, null: false
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }
      t.boolean :is_seller_shipping, null: false, default: true
      t.integer :prefecture, null: false, foreign_key: true
      t.integer :shipping_period, null: false, foreign_key: true
      t.integer :shipping_method, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :item_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
