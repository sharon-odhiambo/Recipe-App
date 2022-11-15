class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    food = Food.new(name: food_params[:name], measurement_unit: food_params[:measurement_unit],
                    price: food_params[:price])
    p food
    flash[:notice] = if food.save
                       'Food created successfully'
                     else
                       'Error'
                     end
    redirect_to foods_path
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
