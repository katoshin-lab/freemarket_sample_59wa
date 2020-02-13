module ApplicationHelper
  require 'time'

  def redirect_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
      flash.now[:alert] = 'ログインが必要です！'
    end
  end

  def redirect_to_root
    redirect_to root_path unless session[:user_registration?]
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
  
  def set_categories
    @categories = Category.where(ancestry: nil)
    @subcategories = []
    @categories.each do |category|
      @subcategories << category.children
    end
    @sub_subcategories = []
    @subcategories.each do |categories|
      categories.each do |category|
        @sub_subcategories << category.children.limit(20)
      end
    end
  end

end
