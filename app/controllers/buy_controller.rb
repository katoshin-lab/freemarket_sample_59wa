class BuyController < ApplicationController
  include PaymentsHelper
  include ItemHelper

  def show
    @item = Item.find(params[:id])
    @delivery = current_user.user_delivery
    @payment = UserPayment.where(user_id: current_user.id).first
    get_card_info
  end

  def create
    @item = Item.find(item_id)
    require 'payjp'
    @payment = UserPayment.where(user_id: current_user.id).first
    @delivery = current_user.user_delivery
    get_card_info
    if @item.item_status_id == 3
      @errors = "出品停止中の商品です"
      return_to_show
    end
    if @item.item_status_id == 4
      @errors = "販売済みの商品です"
      return_to_show
    end
    require 'payjp'
    @payment = UserPayment.where(user_id: current_user.id).first
    if @payment.present?
      customer = @payment.customer_id
      card = @payment.card_id
    else
      @errors = "支払い情報が登録されていません"
      return_to_show
    end
    payjp_setting
    if charge = Payjp::Charge.create(
      amount: @item.price,
      card: card,
      customer: customer,
      currency: 'jpy',
      description: 'freemarket_sample_59wa payment'
    )
      @dealing = Dealing.new(dealing_params)
      @dealing.charge = charge[:id]
      else
        @errors = "カード決済においてエラーが発生しました"
        return_to_show
    end
    if @dealing.save
      @item.update(item_status_id: 4)
    else
      @errors = "エラーが発生しました"
      return_to_show
    end
end

  private

  def return_to_show
    render :show
    return
  end

  def item_id
    params.required(:item)[:id]
  end

  def dealing_params
    {
      buyer_id: current_user.id,
      item_id: item_id,
      last_name: @delivery.last_name,
      first_name: @delivery.first_name,
      last_name_kana: @delivery.last_name_kana,
      first_name_kana: @delivery.first_name_kana,
      postal_number: @delivery.postal_number,
      prefecture_id: @delivery.prefecture_id,
      city: @delivery.city,
      block: @delivery.block,
      building_name: @delivery.building_name,
      phone_number: @delivery.phone_number,
      dealing_status_id: 1
    }
  end

end
