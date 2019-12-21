class SignupController < ApplicationController
  def sms_authentication
    @profile = Profile.new
  end
end
