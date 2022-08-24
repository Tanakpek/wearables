class Wearable < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :brand, :category, :price, :description, :title, :size, :photos, presence: true
  validates :category, inclusion: { in: ["watch", "jacket", "glassed"]}
  has_many_attached :photos

end
