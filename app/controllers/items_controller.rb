class ItemsController < ApplicationController
  include ApplicationHelper
  include ItemHelper
  before_action :set_item, only: [:show, :destroy]
  before_action :set_destroy, only: [:destroy]
  before_action :redirect_to_login, except: [:index, :show]

  def index
    @items = Item.includes(:images).order(id: 'DESC').limit(10)
  end

  def create
    item_subcategory
    @item = Item.new(item_params)
    if @item.images.present?
      item_save
    else
      respond_to do |format| 
        format.js { render alert_image }
      end
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
    @subcategories = []
    @sub_subcategories = []
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @seller_items = @item.seller.sell_items.where.not(id: @item.id).includes(:images).order(id: "DESC").limit(6)
    @likes_counts = Like.group(:item_id).count
    @likes_count = @likes_counts.values_at(params[:id].to_i)[0]
    @prev_item = Item.find(params[:id].to_i - 1) if Item.exists?(id: params[:id].to_i - 1)
    @next_item = Item.find(params[:id].to_i + 1) if Item.exists?(id: params[:id].to_i + 1)
  end

  def destroy
    if @item.seller_id == current_user.id && @item.destroy
      flash[:notice] = '商品が削除されました'
      redirect_to mypages_path
    else
      flash.now[:alert] = '商品の削除に失敗しました'
      @seller_items = @item.seller.sell_items.where.not(id: @item.id).includes(:images).order(id: "DESC").limit(6)
      @likes_counts = Like.group(:item_id).count
      @likes_count = @likes_counts.values_at(params[:id].to_i)[0]
      @prev_item = Item.find(params[:id].to_i - 1) if Item.exists?(id: params[:id].to_i - 1)
      @next_item = Item.find(params[:id].to_i + 1) if Item.exists?(id: params[:id].to_i + 1)
      render :show
    end
  end

  def set_destroy
    unless user_signed_in? && @item.seller_id == current_user.id
      redirect_to item_path(@item.id)
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_subcategory
    @category = params.required(:item)[:category_id]
    @subcategory = params[:item_subcategory]
    @sub_subcategory = params[:item_sub_subcategory]
  end

  def item_category
    if @sub_subcategory.present?
      return @sub_subcategory
    elsif @subcategory.present? && Category.find(@subcategory).children.empty?
      return @subcategory
    end
  end

  def item_save
    if @item.save
      respond_to do |format| 
        format.js { render ajax_redirect_to(root_path) }
      end
    else
      respond_to do |format| 
        format.js { render alert_text }
      end
    end
  end
  
  def item_params
    params.required(:item).permit(:name, :detail, :condition_id, :is_seller_shipping, :prefecture_id, :shipping_method_id,:shipping_period_id, :price, images_attributes: [:image]).merge(seller_id: current_user.id, item_status_id: 1, category_id: item_category)
  end
end
