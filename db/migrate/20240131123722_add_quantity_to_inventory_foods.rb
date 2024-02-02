class AddQuantityToInventoryFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :inventory_foods, :quantity, :integer
  end
end
