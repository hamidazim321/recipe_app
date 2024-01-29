class RecipeController < ApplicationController
  def index
    # recipe = Recipe.where(user_id: current_user.id)
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  # def create
  # end

  def destroy 
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.destroy
      flash[:notice] = "recipe deleted"
    else
      flash[:error] = @recipe.errors.full_messages.to_sentence
    end
    redirect_to request.referrer
  end

  def public_recipe
    @recipes = Recipe.where(public: true)
  end
end
