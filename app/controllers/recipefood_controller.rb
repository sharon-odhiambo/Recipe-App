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
end
