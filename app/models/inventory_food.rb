class InventoryFood < ApplicationRecord
  belongs_to :inventory, foreign_key: 'inventory_id'
  belongs_to :food
end
