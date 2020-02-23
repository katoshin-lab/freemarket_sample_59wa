# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  before_action :configure_sign_up_params, only: [:create]
  before_action :redirect_to_root, only: [:create]
  before_action :time_out, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    session[:user_registration?] = true
    if session[:sns_credential?]
      @user_name = session[:user_name]
      @user_email = session[:user_email]
    else
      set_time
    end
    super
  end

  # POST /resource
  def create
    begin
      if User.validation?(params[:user])
        @user = User.new(user_params)
        @user.save
        if session[:sns_credential?]
          @sns_user = SnsCredential.find_by(token: session[:sns_credential_token])
          @sns_user.update(user_id: @user.id) if session[:sns_credential_token] == @sns_user.token
        end
      else
        render action: 'new'
      end
    rescue
      render action: 'new'
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :birthday, :last_name, :first_name, :last_name_kana, :first_name_kana])
  end

  def time_out
    redirect_to time_out_signups_path if passed_time > 3600
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :birthday, :last_name, :first_name, :last_name_kana, :first_name_kana)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :birthday, :last_name, :first_name, :last_name_kana, :first_name_kana])
  # end

  # def update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :birthday, :last_name, :first_name, :last_name_kana, :first_name_kana])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
