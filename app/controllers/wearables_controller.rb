class WearablesController < ApplicationController

  def index
    @wearables = policy_scope(Wearable)

    if params[:query].present?
      @wearables = Wearable.search_by_title_and_description(params[:query])
    else
      @wearables = Wearable.all
    end

    @markers = @wearables.geocoded.map do |wearable|
      {
        lat: wearable.latitude,
        lng: wearable.longitude
      }
    end
  end

  def new
    @wearable = Wearable.new
    authorize @wearable
  end

  def edit
    @wearable = Wearable.find(params[:id])
    authorize @wearable
  end

  def show
    @wearable = Wearable.find_by_id(params[:id])
    authorize @wearable

    @bookings = Booking.where(wearable: @wearable)
    @reviews = []
    @bookings.each do |b|
      (Review.where(booking: b)).each do |r|
        @reviews << r
      end
    end
    @markers = [{lat: @wearable.geocode[0], lng: @wearable.geocode[1]}]
  end

  def update
    @wearable = Wearable.find(params[:id])
    @wearable.update(params_wearable)
    authorize @wearable
    if @wearable.save
      redirect_to wearable_path(@wearable)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @wearable = Wearable.new(params_wearable)
    @wearable.user = current_user
    authorize @wearable
    if @wearable.save
      redirect_to wearable_path(@wearable)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @wearable = Wearable.find(params[:id])
    authorize @wearable
    @wearable.destroy!
    redirect_to wearables_path, status: :see_other
  end

  private

  def params_wearable
    params.require(:wearable).permit(:title, :description, :brand, :category, :size, :address, :price, photos: [])
  end

end
