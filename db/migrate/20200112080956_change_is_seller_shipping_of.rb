class ChangeIsSellerShippingOf < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :is_seller_shipping, :boolean, null: false, default: nil
  end
end
