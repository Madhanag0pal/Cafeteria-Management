class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item

  def to_s
    menu_item
  end

  def price
    menu_item.price * quantity
  end

  def self.price
    all.map { |item| item.price }.sum()
  end

  def self.place_order(order,address_id)
    all.each do |item|
      OrderItem.create(order_id: order.id, menu_item_id: item.menu_item_id, quantity: item.quantity, price: item.price)
    end
    order.price = all.price
    order.save
    all.destroy_all
  end
end
