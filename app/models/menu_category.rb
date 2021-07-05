class MenuCategory < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  has_many :menu_category_item

  validates :name, presence: true, uniqueness: true
end
