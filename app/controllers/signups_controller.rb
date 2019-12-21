class SignupsController < ApplicationController
  def sms_authentication
  end

  def sms_post
    @user_identification = User_identification.new
  end
end
