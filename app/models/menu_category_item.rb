class MenuCategoryItem < ApplicationRecord
  belongs_to :menu_category
  belongs_to :menu_item
end
