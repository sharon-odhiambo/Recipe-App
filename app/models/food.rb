class Food < ApplicationRecord
  has_many :recipe_foods, foreign_key: 'food_id', dependent: :destroy
  has_many :inventory_foods, foreign_key: 'food_id', dependent: :destroy
end
