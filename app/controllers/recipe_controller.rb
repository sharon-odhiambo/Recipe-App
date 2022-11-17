class RecipeController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    p @recipes
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    return unless @recipe.destroy

    redirect_to recipe_path
  end

  def new_recipe
    @recipe = Recipe.new
  end

  def add_new_recipe
    @new_recipe = Recipe.new(name: params[:name], description: params[:description],
                             cooking_time: params[:cooking_time], preparation_time: params[:preparation_time], public: params[:public], user_id: current_user.id)
    respond_to do |format|
      if @new_recipe.save
        format.html { redirect_to '/recipes', notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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
