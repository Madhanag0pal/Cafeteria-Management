class MenuItem < ApplicationRecord
  has_many :menu_category_item, dependent: :destroy

  validates :name, :price, presence: true
  validates :name, uniqueness: true
end
