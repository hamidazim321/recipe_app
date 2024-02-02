class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public_recipes]
  def index
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(recipe_foods: :food).find_by_id(params[:id])
    @inventories = Inventory.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe Created'
      redirect_to recipes_path
    else
      flash[:error] = @recipe.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.destroy
      flash[:notice] = 'recipe deleted'
    else
      flash[:error] = @recipe.errors.full_messages.to_sentence
    end
    redirect_to request.referrer
  end

  def public_recipes
    @recipes = Recipe.select('recipes.*, COUNT(recipe_foods.id) AS food_count, SUM(foods.price) AS total_price')
      .left_outer_joins(:user, recipe_foods: :food)
      .where(public: true)
      .group('recipes.id, users.id')
      .order(created_at: :desc)
  end

  def update_public
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.toggle!(:public)
      flash[:notice] = 'public state updated'
    else
      flash[:error] = @recipe.errors.full_messages.to_sentence
    end
    redirect_to request.referrer
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time,
                                   :public).merge(user_id: current_user.id)
  end
end
