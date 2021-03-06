class CreateDealings < ActiveRecord::Migration[5.2]
  def change
    create_table :dealings do |t|
      t.references :buyer,                  null: false, foreign_key: { to_table: :users }
      t.references :item,                   null: false, foreign_key: true
      t.string :charge,                     null: false
      t.integer :dealing_status_id,         null: false
      t.string :last_name,                  null: false, default: "", limit: 40
      t.string :first_name,                 null: false, default: "", limit: 40
      t.string :last_name_kana,             null: false, default: "", limit: 40
      t.string :first_name_kana,            null: false, default: "", limit: 40
      t.string :postal_number,              null: false, default: "", limit: 10
      t.integer :prefecture_id,             null: false, default: 0
      t.string :city,                       null: false, default: "", limit: 50
      t.string :block,                      null: false, default: "", limit: 50
      t.string :building_name,              limit: 50
      t.integer :phone_number,              limit: 5
      t.timestamps
    end
  end
end
