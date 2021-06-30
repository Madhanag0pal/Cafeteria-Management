class MenuItem < ApplicationRecord
  belongs_to :menu_category
  has_many :cart_items, dependent: :destroy

  validates :name, :price, presence: true
  validates :name, uniqueness: true
end
