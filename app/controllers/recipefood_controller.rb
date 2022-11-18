class RecipefoodController < ApplicationController
  def new
    @foods = Food.all
    @recipe = RecipeFood.new
    @recipe_id = params[:recipe_id]
  end

  def create
    @foods = Food.all
    @recipe_id =
      @recipefood = RecipeFood.new(quantity: params[:quantity],
                                   recipe_id: params[:recipe_id],
                                   food_id: params[:food_id])
    if @recipefood.save
      redirect_to "/recipes/#{params[:recipe_id]}", notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show_list
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory])
    @inventory_food = InventoryFood.includes(:food).all.where(inventory_id: @inventory.id).map do |a|
      { name: a.food.name, quantity: a.quantity }
    end
    @recipe_food = RecipeFood.includes(:food).all.where(recipe_id: @recipe.id)
    @shopping = @recipe_food.select do |a|
      (a.quantity - (if (@inventory_food.select do |b|
                           b[:name] == a.food.name
                         end).size.zero?
                       0
                     else
                       (@inventory_food.select { |b| b[:name] == a.food.name })[0][:quantity]
                     end)).positive?
    end
  end
end
