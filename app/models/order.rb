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

  def user
    User.find(user_id)
  end

  def self.pending
    where(status: 1).reverse
  end

  def self.online
    where.not(address: nil).pending
  end

  def self.walk_in
    where(address: nil).pending
  end

  def self.delevered
    where(status: 2)
  end

  def self.today
    all.select { |order| order.created_at.to_date == Date.today }
  end

  def self.canceled
    where(status: 3)
  end
end
