class Order < ApplicationRecord
  belongs_to :status
  belongs_to :user
  has_many :order_items, dependent: :destroy

  def pending?
    status_id == 1
  end

  def delevered?
    status_id == 2
  end

  def canceled?
    status_id == 3
  end

  def self.pending
    where(status: 1)
  end

  def self.delevered
    where(status: 2)
  end

  def self.canceled
    where(status: 3)
  end
end
