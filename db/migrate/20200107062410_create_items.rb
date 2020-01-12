class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, limit: 80
      t.text :detail, null: false
      t.integer :price, null: false
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }
      t.boolean :is_seller_shipping, null: false
      t.integer :prefecture_id, null: false, foreign_key: true
      t.integer :shipping_period_id, null: false, foreign_key: true
      t.integer :shipping_method_id, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :item_status_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
