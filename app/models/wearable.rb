class Wearable < ApplicationRecord
  monetize :price_cents

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :brand, :category, :price, :description, :title, :size, :photos, :address, presence: true
  validates :category, inclusion: { in: ["watch", "jacket", "glassed"] }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: { tsearch: { prefix: true } }
end
