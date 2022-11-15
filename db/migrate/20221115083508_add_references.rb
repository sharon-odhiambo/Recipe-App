class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :user, foreign_key: true
    add_reference :inventories, :user, foreign_key: true
    add_reference :recipe_foods, :recipe, foreign_key: true
    add_reference :recipe_foods, :food, foreign_key: true
    add_reference :inventory_foods, :inventory, foreign_key: true
    add_reference :inventory_foods, :food, foreign_key: true
  end
end
