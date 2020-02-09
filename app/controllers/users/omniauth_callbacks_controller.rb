# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ApplicationHelper
  require 'securerandom'
  require 'time'
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def facebook
    session[:sns_credential_token] = SecureRandom.uuid
    callback_for(:facebook)
  end

  def google_oauth2
    session[:sns_credential_token] = SecureRandom.uuid
    callback_for(:google)
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  def passthru
    super
  end

  def callback_for(provider)
    @auth = request.env['omniauth.auth']
    @sns_user = SnsCredential.find_by(name: @auth.info.name)
    unless @sns_user
      sns_credential = SnsCredential.new(
        uid: @auth.uid,
        provider: @auth.provider,
        name: @auth.info.name,
        email: @auth.info.email,
        token: session[:sns_credential_token]
      )
      sns_credential.save!
      @sns_user = SnsCredential.find_by(name: @auth.info.name)
      session[:sns_credential?] = true
      session[:user_name] = @sns_user.name
      session[:user_email] = @sns_user.email
    end
    @user = User.from_omniauth(@auth)
    if @user.present?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      set_time
      redirect_to new_user_registration_path
    end
  end

  # GET|POST /users/auth/twitter/callback
  def failure
    redirect_to root_path
  end

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource)
  end

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
