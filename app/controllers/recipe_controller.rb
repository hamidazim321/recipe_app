class RecipeController < ApplicationController
  def index 
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  # def create
  # end

  # def destroy 
  # end
end
