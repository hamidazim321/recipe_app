class AddFoodAndInventoryReferencesToInventoryFoods < ActiveRecord::Migration[7.1]
  def change
    add_reference :inventory_foods, :inventory, null: false, foreign_key: true
    add_reference :inventory_foods, :food, null: false, foreign_key: true
  end
end
