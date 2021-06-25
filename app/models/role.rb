class Role < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_s
    "#{name}"
  end
end
