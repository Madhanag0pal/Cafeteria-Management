class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item

  def name
    menu_item.name
  end

  def price
    menu_item.price * quantity
  end

  def available?
    menu_item.status
  end

  def self.available?
    all.all? { |cart_item| cart_item.menu_item.status }
  end

  def self.price
    all.map { |item| item.price }.sum()
  end

  def self.place_order(order)
    if all.available?
      all.each do |item|
        OrderItem.create(order_id: order.id, name: item.name, quantity: item.quantity, price: item.price)
      end
      order.price = all.price
      order.save
      all.destroy_all
    end
  end
end
