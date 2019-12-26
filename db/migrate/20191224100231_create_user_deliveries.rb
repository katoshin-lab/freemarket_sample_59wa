class CreateUserDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_deliveries do |t|
      t.string :last_name,                 null: false, default: "", limit: 40
      t.string :first_name,                null: false, default: "", limit: 40
      t.string :last_name_kana,            null: false, default: "", limit: 40
      t.string :first_name_kana,           null: false, default: "", limit: 40
      t.integer :postal_number,            null: false
      t.integer :prefecture_id,            null: false, default: 0
      t.string :city,                      null: false, default: "", limit: 50
      t.string :block,                     null: false, default: "", limit: 50
      t.string :building_name,             limit: 50
      t.string :phone_number,              limit: 5
      t.references :user,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
