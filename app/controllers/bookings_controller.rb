
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
    @booking.status = "pending"
    @booking.user = current_user
    @booking.wearable = @wearable

    price_object = Stripe::Price.create({
      unit_amount: @wearable.price_cents,
      currency: 'eur',
      product: @wearable.stripe_id,
    })

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
        price: price_object,
        quantity: 1
      }],
      success_url: "https://www.google.com/",
      cancel_url: "https://www.google.com/"
    )
    if @booking.save
      @booking.update(checkout_session_id: session.id)
      redirect_to new_booking_payment_path(@booking)
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

  def show
    @booking = Booking.find_by_id(params[:id])
    authorize @booking
    @wearable = @booking.wearable
    authorize @wearable
  end


  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :wearable_id)
  end

end
