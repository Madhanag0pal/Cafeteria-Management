class OrderItem < ApplicationRecord
  belongs_to :menu_item

  def name
    menu_item.name
  end
end
