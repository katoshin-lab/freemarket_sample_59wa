class SignupsController < ApplicationController
  def sms_authentication
  end

  def sms_post
    User.update(user_params)
    mobile_phone_number = params[:mobile_phone_number]
    phone_number = PhonyRails.normalize_number mobile_phone_number, country_code: 'JP'
    sms_number = rand(10000..99999)
    session[:sms_number] = sms_number
    client = Twilio::REST::Client.new(ENV["TWILLIO_SID"],ENV["TWILLIO_TOKEN"])
    begin
      client.api.account.messages.create(
        from: ENV["TWILLIO_NUMBER"],
        to: phone_number,
        body: "Fmarketの認証番号は#{sms_number}です。"
      )
    rescue
      render "signups/sms_authentication"
      return false
    end
    redirect_to sms_confirmation_signups_path
  end

  def sms_confirmation
  end

  def sms_check
    @user = User.new
    confirmation_number = params[:confirmation_number]
    if confirmation_number.to_i == session[:sms_number]
      redirect_to new_address_path
    else
      render "signups/sms_confirmation"
    end
  end

  def user_delivery
    @user_delivery = UserDelivery.new
  end

  def post_user_delivery
  end

  protected

  def user_params
    params.permit(:mobile_phone_number)
  end

  def user_delivery_params
    params.permit()
  end
end
