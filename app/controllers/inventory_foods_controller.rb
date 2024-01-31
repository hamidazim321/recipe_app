class InventoryFoodsController < ApplicationController
  def create
    @inventoryfood = InventoryFood.new(inventory_food_params)
    if @inventoryfood.save
      flash[:notice] = "food created successfully"
    else
      flash[:error] = @inventoryfood.errors.full_messages.to_sentence
    end
    redirect_to request.referrer
  end

  def destroy

  end

  private
  def inventory_food_params
  params.require(:inventory_food).permit(:inventory_id, :quantity, food_attributes: [:name, :measurement_unit, :price])
  end
end
