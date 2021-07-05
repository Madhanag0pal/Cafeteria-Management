class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item

  def to_s
    menu_item
  end
end
