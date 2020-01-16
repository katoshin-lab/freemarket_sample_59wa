class DeliveriesController < ApplicationController
  def new
    @user_delivery = UserDelivery.new
  end

  def create
    @user_delivery = UserDelivery.new(user_delivery_params)
    if @user_delivery.save
      redirect_to new_payment_path
    else
      render action: "new"
    end
  end

  def update
  end

  protected

  def user_delivery_params
    params.require(:user_delivery).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_number, :prefecture_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
