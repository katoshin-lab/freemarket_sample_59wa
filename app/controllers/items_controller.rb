class ItemsController < ApplicationController
  def index
  end

  def new
    @item = ""
    @prefectures = Prefecture.all
    @shipping_methods = ShippingMethod.all
    @shipping_periods = ShippingPeriod.all
    @categories = Category.where(ancestry:nil)
  end
end
