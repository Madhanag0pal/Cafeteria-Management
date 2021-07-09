class MenuCategoryItem < ApplicationRecord
  belongs_to :menu_category
  belongs_to :menu_item

  def active?
    (menu_category.status && menu_item.status)
  end

  def self.menu_category
    all.map { |item| item.menu_category }
  end

  def self.menu_item
    all.map { |item| item.menu_item }
  end
end
