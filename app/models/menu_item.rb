class MenuItem < ApplicationRecord
  belongs_to :menu_categorie
  has_many :cart_items, dependent: :destroy

  validates :name, :price, presence: true
end
