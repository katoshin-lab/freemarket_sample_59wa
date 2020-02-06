module ApplicationHelper
  require 'time'
  def redirect_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
      flash.now[:alert] = 'ログインが必要です！'
    end
  end

  def set_time
    t = Time.now.to_s
    session[:time] = Time.parse(t).to_i
  end

  def passed_time
    t = Time.now.to_s
    time = Time.parse(t).to_i
    pass_time = time - session[:time]
    return pass_time
  end
end
