class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventories = Inventory.where(user_id: current_user.id)
  end

  def show
    @inventory = Inventory.includes(inventory_foods: :food).find_by_id(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory created Successfully.'
    else
      render :new, alert: 'Could not create inventory.'
    end
  end

  def destroy
    @inventory = Inventory.find_by_id(params[:id])
    @inventory.destroy

    if @inventory.destroyed?
      flash[:notice] = 'Successfully deleted inventory.'
      redirect_to inventories_path
    else
      flash[:alert] = 'Could not delete inventory.'
      redirect_back(fallback_location: inventories_path)
    end
  end

  def shopping_list
    @inventory = Inventory.includes(inventory_foods: :food).find_by_id(params[:inventory_id])
    @recipe = Recipe.includes(recipe_foods: :food).find_by_id(params[:recipe_id])

    @missing_foods = []

    @recipe.recipe_foods.each do |recipe_food|
      inventory_food = @inventory.inventory_foods.find { |f| f.food_id == recipe_food.food_id }

      if inventory_food.nil? || inventory_food.quantity < recipe_food.quantity
        missing_quantity = inventory_food.nil? ? recipe_food.quantity : recipe_food.quantity - inventory_food.quantity
        cost = (missing_quantity/recipe_food.quantity) * recipe_food.food.price
        @missing_foods << { name: recipe_food.food.name, missing_quantity: missing_quantity, cost: cost }
      end
    end
  end



  private

  def inventory_params
    params.require(:inventory).permit(:name, :description).merge(user: current_user)
  end
end
