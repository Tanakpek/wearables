class Wearable < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  validates :brand, :category, :price, :description, :title, :size, :photos, presence: true
  validates :category, inclusion: { in: ["watch", "jacket", "glassed"]}
  has_many_attached :photos

end
