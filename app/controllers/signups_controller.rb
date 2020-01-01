class SignupsController < ApplicationController

  def new
    @user = User.new
  end

  def sms_authetication
  end
  
end
