class Wearable < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :brand, :category, :price, :description, :title, presence: true
  validates :category, inclusion: { in: ["watch", "jacket", "glassed"] }
end
