class Booking < ApplicationRecord
  belongs_to :wearable
  belongs_to :user
  has_one :review
end
