class Address < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 50 }
end
