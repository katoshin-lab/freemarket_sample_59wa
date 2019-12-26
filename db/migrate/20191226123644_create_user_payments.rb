class CreateUserPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_payments do |t|

      t.timestamps
    end
  end
end
