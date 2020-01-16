class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order(id: 'DESC').limit(10)
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

  def show
    @item = Item.find(params[:id])
    @seller_items = @item.seller.sell_items.where.not(id: @item.id).includes(:images).limit(6)
    @likes_counts = Like.group(:item_id).count
    @likes_count = @likes_counts.values_at(params[:id].to_i)[0]
    @prev_item = Item.find(params[:id].to_i - 1) if Item.exists?(id: params[:id].to_i - 1)
    @next_item = Item.find(params[:id].to_i + 1) if Item.exists?(id: params[:id].to_i + 1)
  end
end
