class BookingsController < ApplicationController
  def index
    Booking.all
  end

  def new
    @wearable = Wearable.find_by_id(params[:wearable_id])
    @booking = Booking.new
    @bookings_for_wearable = Booking.where(wearable: @wearable, status: 'confirmed')
  end
end
