class MenuCategory < ApplicationRecord
  has_many :menu_category_item, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def enable
    menu_items = MenuCategoryItem.where(menu_category_id: id).menu_item
    set_menu_item_status(menu_items, true)
    status = true
    save
  end

  def disable
    menu_items = MenuCategoryItem.where(menu_category_id: id).menu_item
    set_menu_item_status(menu_items, false)
    status = false
    save
  end

  def set_menu_item_status(menu_items, status)
    menu_items.each do |menu_item|
      MenuItem.update(menu_item.id, status: status)
    end
  end
end
