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
    role.admin?
  end

  def clerk?
    role.clerk?
  end

  def customer?
    role.customer?
  end
end
