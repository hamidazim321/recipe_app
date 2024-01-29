class RecipeController < ApplicationController
  def index 
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
end
