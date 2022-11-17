class InventoryFoodController < ApplicationController
  def index
    @inventoryfood = InventoryFood.all
  end

  def create
    @foods = Food.all
    @inventoryfood = InventoryFood.create(inventory_food_params)
    @inventoryfood.inventory = Inventory.find(params[:inventory_id])
    if @inventoryfood.save
      redirect_to inventory_url(@inventoryfood.inventory), notice: 'Inventoryfood was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @inventoryfood = InventoryFood.new
    @foods = Food.all
  end

  # def destroy
  #     @inventoryfood = InventoryFood.find(params[:id])
  #     @inventoryfood.destroy
  #     redirect_to inventory_url(@inventoryfood.inventory), notice: "Inventoryfood was successfully destroyed."
  # end

  def destroy
    food = InventoryFood.find(params[:id])
    p food
    food.destroy
    redirect_to inventory_inventory_food_path
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
