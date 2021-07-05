class MenuItem < ApplicationRecord
  has_many :menu_category_item
  has_many :cart_items, dependent: :destroy

  validates :name, :price, presence: true
  validates :name, uniqueness: true
end
