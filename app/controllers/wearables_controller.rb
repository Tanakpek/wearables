class WearablesController < ApplicationController

  def index
    @wearables = Wearable.all
  end

  def new
    @wearable = Wearable.new
  end

  def edit
    @wearable = Wearable.find(params[:id])
  end

  def show
    @wearable = Wearable.find(params[:id])
  end

  def update
    @wearable = Wearable.find(params[:id])
    @wearable.update(params_wearable)
    if @wearable.save
      redirect_to wearable_path(@wearable)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @wearable = Wearable.new(params_wearable)
    @wearable.user = current_user
    if @wearable.save
      redirect_to wearable_path(@wearable)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_wearable
    params.require(:wearable).permit(:title, :description, :brand, :category, :size, :price, photos: [])
  end

end
