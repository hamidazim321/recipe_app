class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public_recipes]
  def index
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
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

  def public_recipes
    @recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
  end
end
