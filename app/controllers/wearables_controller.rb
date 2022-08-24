class WearablesController < ApplicationController

  def index
    @wearables = policy_scope(Wearable)
    @wearables = Wearable.all
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
    @wearable = Wearable.find(params[:id])
    authorize @wearable
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
