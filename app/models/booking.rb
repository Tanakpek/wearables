class Booking < ApplicationRecord
  belongs_to :wearable
  belongs_to :user
  has_one :review
  validates :start_date, :end_date, :status, presence: true  #status = pending | current | closed |
end
