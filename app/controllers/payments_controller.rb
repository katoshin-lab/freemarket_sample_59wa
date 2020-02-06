class PaymentsController < ApplicationController
  require 'payjp'
  include PaymentsHelper
  include ApplicationHelper
  before_action :redirect_to_login

  def index
    @payment = UserPayment.where(user_id: current_user.id).first
    if @payment.present?
      payjp_setting
      @customer = Payjp::Customer.retrieve(@payment.customer_id)
      @cards_info = @customer.cards.all
    end
  end

  def new
  end
  
  def create
    payjp_setting
    if params['payjp_token'].blank?
      redirect_to action: 'new'
    else
      customer = Payjp::Customer.create(
        description: "test",
        email: current_user.email,
        card: params['payjp_token'],
        metadata: {user_id: current_user.id}
      )
      @user_payment = UserPayment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @user_payment.save
        redirect_to complete_signups_path
      else
        redirect_to action: new
      end
    end
  end

  def update
    payjp_setting
    @payment = UserPayment.find(params[:id])
    if @payment.update(card_update_params)
      render json: {}, status: 200
    else
      render json: {'message': 'error'}, status: 422
    end
  end

  def destroy
  end

  private

  def card_update_params
    params.require(:user_payment).permit(:card_id)
  end
end
