class MypagesController < ApplicationController
  include ApplicationHelper
  before_action :redirect_to_login
  def index
  end

  def logout
  end

  def profile
  end

  def addcard
    
  end

  def card_info
    
  end

  def personal_info
    @users = User.all
    @prefectures = Prefecture.all
  end
end
