# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Simbz')
user2 = User.create(name: 'Deno')
user3 = User.create(name: 'Shiraa')

recipe1 = Recipe.create(name: 'Beef', preparation_time: 20, cooking_time: 40, description: 'A beef stew meal', public: false, user: user1)
recipe2 = Recipe.create(name: 'Chicken', preparation_time: 30, cooking_time: 50, description: 'A chicken stew meal', public: false, user: user1)
recipe3 = Recipe.create(name: 'Mutton', preparation_time: 40, cooking_time: 35, description: 'A mutton stew meal', public: true, user: user2)
recipe4 = Recipe.create(name: 'Pork', preparation_time: 10, cooking_time: 44, description: 'A pork stew meal', public: false, user: user2)
recipe5 = Recipe.create(name: 'Cake', preparation_time: 25, cooking_time: 20, description: 'A cake', public: true, user: user2)
recipe6 = Recipe.create(name: 'Salad', preparation_time: 5, cooking_time: 10, description: 'A salad', public: true, user: user3)

inventory1 = Inventory.create(name: 'Simbz Inventory', user: user1)
inventory2 = Inventory.create(name: 'Deno Inventory', user: user2)
inventory3 = Inventory.create(name: 'Shiraa Inventory', user: user3)

food1 = Food.create(name: 'Beef', measurement_unit: 1, price: 400)
food2 = Food.create(name: 'Chicken', measurement_unit: 1, price: 600)
food3 = Food.create(name: 'Mutton', measurement_unit: 1, price: 300)
food4 = Food.create(name: 'Pork', measurement_unit: 1, price: 500)
food5 = Food.create(name: 'Milk', measurement_unit: 1, price: 70)
food6 = Food.create(name: 'Cabbage', measurement_unit: 1, price: 50)
food7 = Food.create(name: 'Tomato', measurement_unit: 5, price: 50)



recipe_food1 = RecipeFood.create(quantity: 2, food: food1, recipe: recipe1)
recipe_food2 = RecipeFood.create(quantity: 2, food: food7, recipe: recipe1)

recipe_food3 = RecipeFood.create(quantity: 2, food: food2, recipe: recipe2)
recipe_food4 = RecipeFood.create(quantity: 2, food: food7, recipe: recipe2)

recipe_food5 = RecipeFood.create(quantity: 2, food: food3, recipe: recipe3)
recipe_food6 = RecipeFood.create(quantity: 2, food: food7, recipe: recipe3)

recipe_food7 = RecipeFood.create(quantity: 2, food: food4, recipe: recipe4)
recipe_food8 = RecipeFood.create(quantity: 2, food: food7, recipe: recipe4)

recipe_food9 = RecipeFood.create(quantity: 2, food: food5, recipe: recipe5)

recipe_food11 = RecipeFood.create(quantity: 2, food: food6, recipe: recipe6)
recipe_food12 = RecipeFood.create(quantity: 2, food: food7, recipe: recipe6)

inventory_food1 = InventoryFood.create(quantity: 5, food: food1, inventory: inventory1)
inventory_food2 = InventoryFood.create(quantity: 6, food: food7, inventory: inventory1)
inventory_food3 = InventoryFood.create(quantity: 1, food: food2, inventory: inventory1)

inventory_food4 = InventoryFood.create(quantity: 5, food: food3, inventory: inventory2)
inventory_food5 = InventoryFood.create(quantity: 6, food: food7, inventory: inventory2)
inventory_food6 = InventoryFood.create(quantity: 1, food: food4, inventory: inventory2)

inventory_food7 = InventoryFood.create(quantity: 5, food: food6, inventory: inventory3)
inventory_food8 = InventoryFood.create(quantity: 6, food: food7, inventory: inventory3)

