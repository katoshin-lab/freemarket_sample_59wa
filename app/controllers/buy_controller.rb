class BuyController < ApplicationController
  include PaymentsHelper
  include ItemHelper

  def show
    @item = Item.find(params[:id])
    @delivery = current_user.user_delivery
    @payment = UserPayment.where(user_id: current_user.id).first
    get_card_info
  end

  def update
    @item = Item.find(params[:id])
    require 'payjp'
    @payment = UserPayment.where(user_id: current_user.id).first
    @delivery = current_user.user_delivery
    get_card_info
    if @item.item_status_id == 3
      @errors = "出品停止中の商品です"
      render :show
      return
    end
    if @item.item_status_id == 4
      @errors = "販売済みの商品です"
      render :show
      return
    end
    require 'payjp'
    @payment = UserPayment.where(user_id: current_user.id).first
    if @payment.present?
      customer = @payment.customer_id
      card = @payment.card_id
    end
    payjp_setting
    if charge = Payjp::Charge.create(
      amount: @item.price,
      card: card,
      customer: customer,
      currency: 'jpy',
      description: 'freemarket_sample_59wa payment'
    )
      @item.update(item_status_id: 4)
    end
  end

end
