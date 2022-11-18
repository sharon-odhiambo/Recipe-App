require 'rails_helper'

RSpec.describe InventoryFood, type: :feature do
  before :each do
    @user = User.new(name: 'sharon', email: 'sharon@gmail.com', password: 123_456, password_confirmation: 123_456)
    @user.skip_confirmation!
    @user.save
    @inventory = Inventory.create(name: 'inv1', user_id: @user.id)
    @food = Food.create(name: 'pasta', measurement_unit: 'gramme', price: 20)
  end

  it 'is valid' do
    inventory_food = InventoryFood.new(quantity: 4, inventory_id: @inventory.id, food_id: @food.id)
    expect(inventory_food).to be_valid
  end

  it 'not valid without quantity' do
    inventory_food = InventoryFood.new(inventory_id: @inventory.id, food_id: @food.id, quantity: 5)
    expect(inventory_food).to be_valid
  end
end
