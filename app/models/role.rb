class Role < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_s
    "#{name}"
  end

  def admin?
    id == 1
  end

  def clerk?
    id == 2
  end

  def customer?
    id == 3
  end
end
