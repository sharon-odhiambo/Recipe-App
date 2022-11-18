require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
  before :each do
    @user = User.new(name: 'Sharon', email: 'sharon@test.com', password: 123456, password_confirmation: 123456)
    @user.skip_confirmation!
    @user.save
    @recipe = Recipe.create(name: 'rec1', description: 'description here', cooking_time: 12, preparation_time: 12, public: false, user_id: @user.id)
    @food = Food.create(name: 'pasta', measurement_unit: 'gramme', price: 20)
  end

  it 'is valid' do
    recipe_food = RecipeFood.new(quantity: 4, recipe_id: @recipe.id, food_id: @food.id)
    expect(recipe_food).to be_valid
  end
end
