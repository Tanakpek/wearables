
class BookingsController < ApplicationController

  def new
    @wearable = Wearable.find_by_id(params[:wearable_id])
    authorize @wearable
    @booking = Booking.new
    @bookings_for_wearable = Booking.where(wearable: @wearable, status: 'confirmed')
  end

  def create
    @wearable = Wearable.find_by_id(params[:wearable_id])
    authorize @wearable
    @booking = Booking.new(params_booking)
    @booking.status = "unconfirmed"
    @booking.user = current_user
    @booking.wearable = @wearable

    if @booking.save
      redirect_to wearable_path(@wearable)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = policy_scope(Booking)
    @bookings = Booking.where(user: current_user)
    w = Wearable.where(user: current_user)
    w.each do |wearable|
      @bookings += Booking.where(wearable: wearable)
    end

  end

  def edit
    @booking = Booking.find_by_id(params[:id])
    authorize @booking
    raise
  end

  def update
    @booking = Booking.find_by_id(params[:id])
    authorize @booking
    @booking.update(status: params[:status]) if params[:status]
    redirect_to user_bookings_path(current_user)
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :wearable_id)
  end
end
