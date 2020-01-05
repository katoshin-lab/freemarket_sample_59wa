class DeliveriesController < ApplicationController
  
  def new
    @user_delivery = UserDelivery.new
  end

end
