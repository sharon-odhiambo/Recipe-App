class RecipeController < ApplicationController
  def show
    @recipes = Recipe.where(user_id: current_user.id)
    p @recipes
  end
end
