require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'Test', email: 'test@test.com', password: 123_456, password_confirmation: 123_456)
    @user.skip_confirmation!
    @recipe = Recipe.new(name: 'Simbzz', description: 'test',
                         cooking_time: 20, preparation_time: 30,
                         public: true, user_id: @user.id)
    @food = Food.create(name: 'Water', measurement_unit: 'bottle', price: 2)
  end
  it 'should not be valid without quantity' do
    recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: nil)
    expect(recipe_food).to_not be_valid
  end
end
