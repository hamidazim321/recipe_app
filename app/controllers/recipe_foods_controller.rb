class RecipeFoodsController < ApplicationController
  def create
    @recipefood = RecipeFood.new(recipe_food_params)
    if @recipefood.save
      flash[:notice] = 'food created successfully'
    else
      flash[:error] = @recipefood.errors.full_messages.to_sentence
    end
    redirect_to request.referrer
  end

  def update
    @recipefood = RecipeFood.find(params[:id])
    if @recipefood.update(recipe_food_params)
      flash[:notice] = 'RecipeFood updated successfully'
    else
      flash[:error] = @recipefood.errors.full_messages.to_sentence
    end
    redirect_to request.referrer
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :quantity, food_attributes: %i[name measurement_unit price])
  end
end
