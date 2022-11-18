class RecipeController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
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
                             cooking_time: params[:cooking_time], preparation_time: params[:preparation_time],
                             public: params[:public], user_id: current_user.id)
    respond_to do |format|
      if @new_recipe.save
        format.html { redirect_to '/recipes', notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def create_shopping_list
    @recipe = Recipe.find(params[:id])
    @inventory = Recipe.find(params[:inventory])
    @inventory_food = InventoryFood.includes(:food).all.where(inventory_id: @inventory.id)
    @recipe_food = RecipeFood.includes(:food).all.where(recipe_id: @recipe.id)
    redirect_to "/recipes/#{@recipe.id}/#{@inventory.id}"
  end

  def show_list
    @recipe = Recipe.find(params[:id])
    @inventory = Recipe.find(params[:inventory_id])
    @inventory_food = InventoryFood.includes(:food).all.where(inventory_id: @inventory.id).map {|a| [a.food.name, a.quantity]}
    @recipe_food = RecipeFood.includes(:food).all.where(recipe_id: @recipe.id).map {|a| [a.food.name, a.quantity]}
   @shopping = @recipe_food.each {|f| return @recipe_food unless @recipe_food.includes(@inventory_food)}
   p @shopping
  end

  def public_recipes
    @recipes = Recipe.includes(:user).all.where(public: true).order(created_at: :desc)
  end


  def show
    @inventories = Inventory.all
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.includes(:food).all.where(recipe_id: @recipe.id)
  end
end

