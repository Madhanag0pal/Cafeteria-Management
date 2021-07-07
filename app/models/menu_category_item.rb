class MenuCategoryItem < ApplicationRecord
  belongs_to :menu_category
  belongs_to :menu_item

  def active?
    (menu_category.status && menu_item.status)
  end
end
