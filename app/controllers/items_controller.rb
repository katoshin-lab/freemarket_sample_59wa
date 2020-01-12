class ItemsController < ApplicationController
  def index
  end

  def create
    @item = Item.new(item_params)
    @categories = Category.where(ancestry: params[:ancestry])
    @conditions = Condition.all
    @prefectures = Prefecture.all
    @shipping_methods = ShippingMethod.all
    @shipping_periods = ShippingPeriod.all
    if @item.save
      redirect_to root_path
    else
      render :new, notice: "入力してない項目があります"
    end
    
  end

  def new
    @item = Item.new
    @item.images.build
    @conditions = Condition.all
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
    @seller_items = @item.seller.items.where.not(id: @item.id).includes(:images)
    @likes_counts = Like.group(:item_id).count
    @likes_count = @likes_counts.values_at(params[:id].to_i)[0]
    @prev_item = Item.find(params[:id].to_i - 1) if Item.exists?(id: params[:id].to_i - 1)
    @next_item = Item.find(params[:id].to_i + 1) if Item.exists?(id: params[:id].to_i + 1)
  end

  private
  def category
    if params[:sub_subcategory]
      return params[:sub_subcategory]
    else return params[:subcategory]
    end
  end

  def item_params
    params.required(:item).permit(:name, :detail, :condition_id, :is_seller_shipping, :prefecture_id, :shipping_method_id,:shipping_period_id, :price, images_attributes: [:image, :id]).merge(seller_id: 1, category_id: category, item_status_id: 1)
  end
end
