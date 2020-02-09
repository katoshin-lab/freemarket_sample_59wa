class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
