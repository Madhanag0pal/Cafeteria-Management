class User < ApplicationRecord
  belongs_to :role
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :ratings

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def to_s
    "[Name: #{name} , Role: #{role}]"
  end

  def admin?
    role_id == 1
  end

  def clerk?
    role_id == 2
  end

  def customer?
    role_id == 3
  end

  def self.admin
    where(role_id: 1)
  end
  def self.clerk
    where(role_id: 2)
  end
  def self.customer
    where(role_id: 3)
  end
end
