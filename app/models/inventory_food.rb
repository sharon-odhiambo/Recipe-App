class InventoryFood < ApplicationRecord
  validates :quantity, presence: true
  
  belongs_to :inventory, foreign_key: 'inventory_id'
  belongs_to :food
end
