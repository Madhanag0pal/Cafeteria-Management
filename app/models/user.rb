class User < ApplicationRecord
  belongs_to :role
  has_many :addresses, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def to_s
    "[Name: #{name} , Role: #{role}]"
  end
end
