class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ancenstry

      t.timestamps
    end
    add_index :categories, :ancenstry
  end
end
