class DeliveriesController < ApplicationController
  include ApplicationHelper
  before_action :redirect_to_root, only: [:new, :create]
  before_action :redirect_to_login, only: [:show, :update]

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

  def show
    redirect_to root_path unless your_delivery?
    setting_delivery
    @phone_number = "0"+@user_delivery.phone_number.to_s if @user_delivery
  end

  def update
    return unless your_delivery?
    binding.pry
    setting_delivery
    if @user_delivery.update(user_delivery_params)
      render json: {}, status: 200
    else
      render json: {'message': 'error'}, status: 422
    end
  end

  protected

  def setting_delivery
    @user_delivery = UserDelivery.where(user_id: current_user.id).first_or_initialize
  end

  def your_delivery?
    (params[:id]).to_i == current_user.id
  end

  def user_delivery_params
    params.require(:user_delivery).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_number, :prefecture_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
