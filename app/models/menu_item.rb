class MenuItem < ApplicationRecord
  belongs_to :menu
  
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :menu_id, presence: true, numericality: { only_integer: true, message: "must be an integer" }
end
