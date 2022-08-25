class ReviewsController < ApplicationController
  def controller
  end

  def new
    @wearable = Wearable.find(params[:wearable_id])
    @review = Review.new
    authorize @review
  end

  def create
    @wearable = Wearable.find(params[:wearable_id])
    @review = Review.new(params_review)
    @review.booking = @wearable.bookings.last
    authorize @review
    if @review.save!
      redirect_to wearable_path(@wearable)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
