class Order < ApplicationRecord
  belongs_to :status
  has_many :order_items, dependent :destroy
end
