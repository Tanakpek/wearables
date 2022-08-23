class Wearable < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :brand, :category, :price, :description, :title, presence: true
<<<<<<< HEAD
  validates :category, inclusion: { in: ["watch", "jacket", "glassed"]}
  has_many_attached :photos
=======
  validates :category, inclusion: { in: ["watch", "jacket", "glassed"] }
>>>>>>> 6f6b714a68c4c6a90bd55a42ffe9157b26cd8e25
end
