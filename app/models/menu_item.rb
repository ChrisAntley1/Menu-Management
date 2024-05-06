class MenuItem < ApplicationRecord
  belongs_to :menu
  
  validates :name, :price, :menu_id, presence: true
end
