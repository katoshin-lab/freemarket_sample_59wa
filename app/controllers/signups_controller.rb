class SignupsController < ApplicationController
  before_action :redirect_to_root
  def sms_authentication
  end

  def sms_post
    current_user.update_attributes(mobile_phone_number: params[:mobile_phone_number].to_i)
    mobile_phone_number = params[:mobile_phone_number]
    phone_number = PhonyRails.normalize_number mobile_phone_number, country_code: 'JP'
    sms_number = rand(10000..99999)
    session[:sms_number] = sms_number
    client = Twilio::REST::Client.new(Rails.application.credentials.sms_auth[:TWILLIO_SID],Rails.application.credentials.sms_auth[:TWILLIO_TOKEN])
    begin
      client.api.account.messages.create(
        from: Rails.application.credentials.sms_auth[:TWILLIO_NUMBER],
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
      redirect_to new_delivery_path
    else
      render action: "sms_confirmation"
    end
  end

  def complete
  def redirect_to_root
    redirect_to root_path unless session[:user_registration?]
  end
    session.delete(:sns_credential?)
    session.delete(:user_name)
    session.delete(:user_email)
    session.delete(:sns_credential_token)
    session.delete(:sms_number)
  end
end
