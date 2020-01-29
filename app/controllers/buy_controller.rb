class BuyController < ApplicationController
  include PaymentsHelper

  def show
    @item = Item.find(params[:id])
    @delivery = current_user.user_delivery
    @payments = current_user.user_payments
    get_card_info
  end

  def update

  end
  
end
