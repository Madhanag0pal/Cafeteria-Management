class User < ApplicationRecord
  belongs_to :role
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :ratings

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password

  def to_s
    "[Name: #{name} , Role: #{role}]"
  end
end
