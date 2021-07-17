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

  def self.pending(order = :desc)
    where(status: 1).order(created_at: order)
  end

  def self.online
    where.not(address: nil).pending(:asc)
  end

  def self.walk_in
    where(address: nil).pending(:asc)
  end

  def self.delevered
    where(status: 2)
  end

  def self.canceled
    where(status: 3)
  end

  def self.total
    all.sum(:price)
  end
end
