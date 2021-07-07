class MenuCategory < ApplicationRecord
  has_many :menu_category_item, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
