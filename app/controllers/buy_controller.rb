class BuyController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @delivery = current_user.user_delivery
  end

  def update

  end
  
end
