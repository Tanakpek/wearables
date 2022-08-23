class WearablesController < ApplicationController

  def index
    @wearables = Wearable.all
  end

  def new
    @wearable = Wearable.new
  end

end
