class InventoriesController < ApplicationController
  # before_action :set_inventory, only: %i[ show edit update destroy ]
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_food = InventoryFood.includes(:food).all.where(inventory_id: @inventory.id)
  end

  def new
    @inventory = Inventory.new
  end
  
  def edit
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.create(name: inventory_params[:name], user_id: current_user.id)
    
    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    return unless @inventory.destroy
    redirect_to inventories_path
  end

  private
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      # params.fetch(:inventory, {})
      params.require(:inventory).permit(:name)
    end
end
