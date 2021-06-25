class MenuItem < ApplicationRecord
  belongs_to :menu_categorie

  validates :name, :price, presence: true
end
