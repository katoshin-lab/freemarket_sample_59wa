class CreateUserIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_identifications do |t|
      t.string :last_name,             null: false, limit: 40
      t.string :first_name,            null: false, limit: 40
      t.string :last_name_kana,        null: false, limit: 40
      t.string :first_name_kana,       null: false, limit: 40
      t.integer :mobile_phone_number,  null: false, limit: 5, default: ""
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
