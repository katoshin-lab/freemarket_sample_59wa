class SignupsController < ApplicationController

  def new
    @user = User.new
  end

  def sms_authentication
  end

  def sms_confirmation
  end
  
end
