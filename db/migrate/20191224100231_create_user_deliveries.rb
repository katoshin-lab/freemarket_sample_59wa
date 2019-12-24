class CreateUserDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_deliveries do |t|

      t.timestamps
    end
  end
end
