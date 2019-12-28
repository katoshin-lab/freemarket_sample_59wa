class PaymentsController < ApplicationController
  require 'payjp'

  def new
  end
  
  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
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
      binding.pry
      if @user_payment.save
      else
        redirect_to action: new
      end
    end
  end

  def update
  end

  def destroy
  end
end
