class SignupsController < ApplicationController
  def sms_authentication
  end

  def sms_post
    current_user.update_attributes(mobile_phone_number: params[:mobile_phone_number].to_i)
    mobile_phone_number = params[:mobile_phone_number]
    phone_number = PhonyRails.normalize_number mobile_phone_number, country_code: 'JP'
    sms_number = rand(10000..99999)
    session[:sms_number] = sms_number
    client = Twilio::REST::Client.new(Rails.application.credentials[:TWILLIO_SID],Rails.application.credentials[:TWILLIO_TOKEN])
    begin
      client.api.account.messages.create(
        from: Rails.application.credentials[:TWILLIO_NUMBER],
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
    binding.pry
    if confirmation_number.to_i == session[:sms_number]
      redirect_to new_delivery_path
    else
      render action: "sms_confirmation"
    end
  end

  def complete
  end
end
