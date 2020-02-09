class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :store_current_location, unless: :devise_controller?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def store_current_location
    store_location_for(:user, request.url)
  end
end
