class WearablesController < ApplicationController

  def index
    @wearables = Wearable.all
  end
end
