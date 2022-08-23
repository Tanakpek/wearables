class BookingsController < ApplicationController
  def index
    Booking.all
  end

  def new
    @wearable = Wearable.find_by_id(params[:wearable_id])
    authorize @wearable
    @booking = Booking.new
    @bookings_for_wearable = Booking.where(wearable: @wearable, status: 'confirmed')
  end

  def create
    @wearable = Wearable.find_by_id(params[:wearable_id])
    @booking = Booking.new(params_booking)
    @booking.status = "unconfirmed"
    @booking.user = current_user
    @booking.wearable = @wearable

    @booking.save
    authorize @booking
    if @booking.save
      redirect_to new_wearable_booking_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :wearable_id)
  end
end
