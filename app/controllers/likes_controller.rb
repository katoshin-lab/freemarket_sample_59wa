class LikesController < ApplicationController
  include ApplicationHelper
  before_action :item_setting
  before_action :redirect_to_login

  def create
    @like = current_user.likes.new(item_id: params[:item_id])
    if @like.save
      return_likes_count
    else
      return_error
    end
  end
      
  def destroy
    if @like = current_user.likes.find_by(item_id: params[:item_id])
      if @like.destroy
        return_likes_count
      else
        return_error
      end
    else
      return_error
    end
  end

  private

  def item_setting
    @item = Item.find(params[:item_id])
  end

  def return_likes_count
    @likes_count = @item.likes.length
  end

  def return_error
    @likes_count = "err"
  end
end
