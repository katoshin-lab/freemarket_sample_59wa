module ApplicationHelper
  def redirect_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
      flash.now[:alert] = 'ログインが必要です！'
    end
  end

end
