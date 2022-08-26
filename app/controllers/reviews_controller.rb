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

    respond_to do |f|
      if @review.save!
        f.html { redirect_to wearable_path(@wearable) }
        f.json
      else
        f.html { render :new, status: :unprocessable_entity }
        f.json
      end
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
