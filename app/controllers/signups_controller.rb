class SignupsController < ApplicationController

  def new
    @user = User.new
  end

  def sms_authentication
  end
  
end
