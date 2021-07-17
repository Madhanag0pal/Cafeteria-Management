class OrderItem < ApplicationRecord
  belongs_to :order

  def self.quantity
    all.sum(:quantity)
  end
end
