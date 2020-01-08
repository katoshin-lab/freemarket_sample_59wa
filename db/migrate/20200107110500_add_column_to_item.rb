class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition_id, :integer, null: false
  end
end
