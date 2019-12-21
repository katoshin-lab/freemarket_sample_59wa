class SignupsController < ApplicationController
  def sms_authentication
    @user_identification = User_identification.new
  end
end
