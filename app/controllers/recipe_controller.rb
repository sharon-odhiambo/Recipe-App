class RecipeController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    p @recipes
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipe_path
    end
  end

  def public_recipes
    @recipes = Recipe.includes(:user).all.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    p @recipe.public
    @recipe_food = RecipeFood.includes(:food).all.where(recipe_id: @recipe.id)
    p @recipe_food
  end
end
