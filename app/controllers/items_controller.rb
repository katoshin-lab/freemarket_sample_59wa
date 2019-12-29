class ItemsController < ApplicationController
  def index
  end

  def new
    @item = ""
    @prefectures = Prefecture.all
    @shipping_methods = ShippingMethod.all
    @shipping_periods = ShippingPeriod.all
    @categories = Category.where(ancestry: params[:ancestry])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
