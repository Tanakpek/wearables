class Booking < ApplicationRecord
  belongs_to :wearable
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :start_date, :end_date, :status, presence: true  #status = pending | current | closed |
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end
